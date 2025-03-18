import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_guardian/features/barcode_reader_feature/presentation/barcode_view_model/api_service.dart';
import 'package:food_guardian/features/barcode_reader_feature/presentation/barcode_view_model/set_item_details.dart';

import '../../../authentication_feature/register_feature/presentation/register_view/register_widgets/auth_snack_bar.dart';
import '../../../inventory_feature/models/card_itme_model.dart';

class SearchOnFirestore {
  static Future<void> searchOnFireStoreDataBase(
      String barcode, BuildContext context) async {
    List<String> categories = ["Fridge", "Freezer", "Pantry"];
    String category;
    try {
      for (category in categories) {
        final query = await FirebaseFirestore.instance
            .collection(CardItemModel.collectionName)
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection(category)
            .where("barcode", isEqualTo: barcode)
            .get();
        if (query.docs.isNotEmpty) {
          final data = query.docs.first;
          CardItemModel.fromJson(data);
          return;
        }
      }
      await APIService.fetchItemFromAPIs();
    } on Exception catch (e) {
      snackBar(context, "Please try again");
    }
  }
}
