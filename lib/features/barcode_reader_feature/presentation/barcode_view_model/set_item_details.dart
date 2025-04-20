import 'package:flutter/material.dart';
import 'package:food_guardian/features/inventory_feature/presentation/inventory_view_model/write_on_firestore_logic.dart';

import '../../../../core/utils/snack_bar.dart';
import '../../../inventory_feature/inventory_models/card_itme_model.dart';

class SetItemDetails {
  static Future<void> addItemToFirestore(
      String category,
      CardItemModel matchedItem,
      BuildContext context,
      DateTime selectedExpirationDate) async {
    try {
      WriteOnFireStoreLogic.buildAddItemsToFirestore(
          context,
          category,
          matchedItem.itemName,
          matchedItem.itemQuantity,
          selectedExpirationDate,
          matchedItem.itemImage,
          matchedItem.itemBarcode,
          matchedItem.itemIsUsed);
    } on Exception catch (e) {
      snackBar(
          context, "Item not stored please try again!, ${e.toString}", null);
    }
  }
}
