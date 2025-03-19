import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../../../inventory_feature/models/card_itme_model.dart';
import 'api_service.dart';

class SearchOnFirestore {
  static Future searchOnFirestore(String barcode, BuildContext context,
      DateTime selectedExpirationDate) async {
    List<String> categories = ["Fridge", "Freezer", "Pantry"];
    String? category;
    bool isDuplicate = false;

    for (category in categories) {
      final query = await FirebaseFirestore.instance
          .collection(CardItemModel.collectionName)
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection(category)
          .where('barcode', isEqualTo: barcode)
          .where('expirationDate',
              isEqualTo: selectedExpirationDate.toIso8601String())
          .get();

      if (query.docs.isNotEmpty) {
        isDuplicate = true;
        break;
      }
    }

    if (!isDuplicate) {
      // 🔥 Only add if no exact match exists
      await APIService.fetchItemFromAPIs(
          category!, context, barcode, selectedExpirationDate);
    }
  }
}
