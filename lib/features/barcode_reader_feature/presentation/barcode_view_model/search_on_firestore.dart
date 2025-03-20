import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_guardian/features/barcode_reader_feature/presentation/barcode_view_model/set_item_details.dart';

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
          // .where('expirationDate',
          //     isEqualTo: selectedExpirationDate.toIso8601String())
          .get();

      if (query.docs.isNotEmpty) {
        isDuplicate = true;
        final data = query.docs.first;
        final matchedItem = CardItemModel.fromJson(data);

        SetItemDetails.addItemToFirestore(
            category, matchedItem, context, selectedExpirationDate);
        break;
      }
    }

    if (!isDuplicate) {
      APIService.fetchItemFromAPIs(context, barcode, selectedExpirationDate);
    }
  }
}
