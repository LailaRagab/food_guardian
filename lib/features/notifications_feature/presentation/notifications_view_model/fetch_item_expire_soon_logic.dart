import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_guardian/features/inventory_feature/models/card_itme_model.dart';

// 2
import '../../notifications_models/notifications_services.dart';

class FetchItemExpireSoonLogic {
  static Future<void> fetchItemExpireSoonFun() async {
    User? user = FirebaseAuth.instance.currentUser;
    print(
        "ooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo");
    final snapshot = await FirebaseFirestore.instance
        .collection(CardItemModel.collectionName)
        .doc(user?.uid)
        .collection("Fridge")
        .get();
    await fetchItemExpireSoonLoop(snapshot);
  }

  static Future<void> fetchItemExpireSoonLoop(
      QuerySnapshot<Map<String, dynamic>> snapshot) async {
    for (var doc in snapshot.docs) {
      final data = doc.data();
      final name = data['name'];
      final expiry = doc['exDate']; // Timestamp
      final reminderDate =
          expiry.toDate().subtract(Duration(days: 1)); // 1 day before
      print(reminderDate);
      if (reminderDate.isAfter(DateTime.now())) {
        print(
            "ifffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff");
        await NotificationService.scheduleNotification(
            id: doc.id.hashCode,
            title: "⚠️ $name expires tomorrow!",
            body: "Tap to check your fridge",
            scheduledDate: reminderDate);
      }
    }
  }
}
