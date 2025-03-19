import 'package:flutter/src/widgets/framework.dart';
import 'package:food_guardian/features/inventory_feature/models/card_itme_model.dart';
import 'package:food_guardian/features/inventory_feature/presentation/inventory_view_model/write_on_firestore_logic.dart';

import '../../../authentication_feature/register_feature/presentation/register_view/register_widgets/auth_snack_bar.dart';

class SetItemDetails {
  static Future<void> addItemToFirestore(
      String category,
      CardItemModel matchedItem,
      BuildContext context,
      DateTime selectedExpirationDate) async {
    try {
      if (matchedItem != null) {
        WriteOnFireStoreLogic.buildAddItemsToFirestore(
            context,
            category,
            matchedItem.itemName,
            matchedItem.itemQuantity,
            selectedExpirationDate,
            matchedItem.itemImage,
            matchedItem.itemBarcode);
      }
    } on Exception catch (e) {
      snackBar(context, "Item not stored please try again!");
    }
  }
}
