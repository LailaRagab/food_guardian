import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_guardian/features/dashboard_feature/dashboard_models/for_passing_item_state_to_dashboard.dart';
import 'package:food_guardian/features/notifications_feature/notifications_models/store_notifications_using_hive.dart';
import 'package:food_guardian/features/recipes_feature/recipes_models/for_passing_expire_ingredient.dart';
import 'package:hive/hive.dart';

import '../../inventory_feature/inventory_models/card_itme_model.dart';
import 'notifications_services.dart';

class FetchItemExpireSoonLogic {
  static Future<void> fetchItemExpireSoonFun() async {
    List<String> categories = ["Fridge", "Freezer", "Pantry"];

    double expireSoonCount = 0.0;
    double expiredCount = 0.0;
    double freshCount = 0.0;
    int totalCount = 0;
    int fridgeCount = 0;
    int freezerCount = 0;
    int pantryCount = 0;

    for (var category in categories) {
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) return;

      final snapshot = await FirebaseFirestore.instance
          .collection(CardItemModel.collectionName)
          .doc(user.uid)
          .collection(category)
          .get();

      final result = await fetchItemExpireSoonLoop(snapshot, category);

      expireSoonCount += result['expireSoon'] ?? 0.0;
      expiredCount += result['expired'] ?? 0.0;
      freshCount += result['fresh'] ?? 0.0;
      totalCount += result['total'] as int ?? 0;

      if (category == "Fridge") {
        fridgeCount = result['categoryCount'] ?? 0;
      } else if (category == "Freezer") {
        freezerCount = result['categoryCount'] ?? 0;
      } else if (category == "Pantry") {
        pantryCount = result['categoryCount'] ?? 0;
      }
    }

    final passingStatus =
        ForPassingItemStateToDashboard.forPassingItemStateToDashboard;
    passingStatus.setExpireSoonCount(expireSoonCount);
    passingStatus.setExpiredCount(expiredCount);
    passingStatus.setFreshCount(freshCount);
    passingStatus.setTotalItems(totalCount);
    passingStatus.setFridgeCount(fridgeCount);
    passingStatus.setFreezerCount(freezerCount);
    passingStatus.setPantryCount(pantryCount);
  }

  static Future<Map<String, dynamic>> fetchItemExpireSoonLoop(
      QuerySnapshot<Map<String, dynamic>> snapshot, String category) async {
    final box = Hive.box<NotificationModel>('notifications');

    int totalCount = 0;
    double expireSoonCount = 0.0;
    double expiredCount = 0.0;
    double freshCount = 0.0;

    for (var doc in snapshot.docs) {
      totalCount++;

      final data = doc.data();
      final String name = data['name'];
      final Timestamp expiry = data['exDate'];
      final DateTime expiryDate = expiry.toDate();
      final int id = doc.id.hashCode;

      DateTime now = DateTime.now();
      DateTime today = DateTime(now.year, now.month, now.day);
      DateTime expiryDateOnly =
          DateTime(expiryDate.year, expiryDate.month, expiryDate.day);

      int daysUntilExpiry = expiryDateOnly.difference(today).inDays;

      if (daysUntilExpiry > 0 && daysUntilExpiry <= 3) {
        if (!box.keys.contains(id)) {
          await NotificationService.scheduleNotification(
            id: id,
            title: "⚠️ $name expires in $daysUntilExpiry day(s)!",
            body: "Check your $category",
            scheduledDate: expiryDateOnly,
          );
          ForPassingExpireIngredient.instance.addIngredient(name);
        }
        expireSoonCount++;
      } else if (expiryDateOnly.isBefore(today)) {
        expiredCount++;
      } else {
        freshCount++;
      }
    }

    return {
      'expireSoon': expireSoonCount,
      'expired': expiredCount,
      'fresh': freshCount,
      'total': totalCount,
      'categoryCount': totalCount, // used for fridge/pantry/freezer count
    };
  }
}
