// 2
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_guardian/features/inventory_feature/models/card_itme_model.dart';
import 'package:food_guardian/features/notifications_feature/notifications_models/store_notifications_using_hive.dart';
import 'package:food_guardian/features/recipes_feature/recipes_models/for_passing_expire_ingredient.dart';
import 'package:hive/hive.dart';
import 'notifications_services.dart';

class FetchItemExpireSoonLogic {
  static Future<void> fetchItemExpireSoonFun() async {
    List<String> categories = ["Fridge", "Freezer", "Pantry"];
    for (var category in categories) {
      User? user = FirebaseAuth.instance.currentUser;
      final snapshot = await FirebaseFirestore.instance
          .collection(CardItemModel.collectionName)
          .doc(user?.uid)
          .collection(category)
          .get();
      await fetchItemExpireSoonLoop(snapshot, category);
    }
  }

  static Future<void> fetchItemExpireSoonLoop(
      QuerySnapshot<Map<String, dynamic>> snapshot, dynamic category) async {
    final box = Hive.box<NotificationModel>('notifications');
    for (var doc in snapshot.docs) {
      final data = doc.data();
      final name = data['name'];
      final Timestamp expiry = doc['exDate'];
      final DateTime expiryDate = expiry.toDate();
      var id = doc.id.hashCode;
      DateTime now = DateTime.now();
      DateTime todayDateOnly = DateTime(now.year, now.month, now.day);
      DateTime expiryDateOnly =
          DateTime(expiryDate.year, expiryDate.month, expiryDate.day);

// Calculate the number of days until expiry
      int daysUntilExpiry = expiryDateOnly.difference(todayDateOnly).inDays;

// Check if it's 1, 2, or 3 days before expiry
      if (daysUntilExpiry == 2) {
        if (!box.keys.contains(id)) {
          await NotificationService.scheduleNotification(
            id: id,
            title: "⚠️ $name expires in $daysUntilExpiry day(s)!",
            body: "Tap to check your $category",
            scheduledDate: expiryDateOnly, // adjust if needed
          );
          ForPassingExpireIngredient.instance.addIngredient(name);
        }
      }
    }
  }
}
