import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_guardian/core/utils/assets/fonts.dart';
import 'package:food_guardian/features/inventory_feature/models/card_itme_model.dart';
import 'package:food_guardian/features/inventory_feature/presentation/inventory_view/inventory_widgets/delete_and_edit_actions.dart';
import 'package:food_guardian/features/inventory_feature/presentation/inventory_view/inventory_widgets/item_card_details.dart';

import '../../../../../core/utils/assets/colors.dart';

class ItemCard extends StatelessWidget {
  const ItemCard(
      {super.key,
      required this.itemID,
      required this.passedModel,
      required this.subCategory});

  final String itemID;

  final CardItemModel passedModel;

  final String subCategory;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Dismissible(
        movementDuration: Duration(seconds: 3),
        direction: DismissDirection.startToEnd,
        background: DeleteAndEditActions(
          subCategory: subCategory,
        ),
        key: ValueKey(itemID),
        confirmDismiss: (direction) async => false,
        child: Container(
            width: 379,
            height: 123,
            decoration: BoxDecoration(
                color: AppColors.kItemCardBg,
                borderRadius: BorderRadius.all(Radius.circular(35))),
            child: ItemCardDetails(
              model: passedModel,
            )),
      ),
    );
  }
}
