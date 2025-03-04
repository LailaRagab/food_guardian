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
      required this.onDelete,
      required this.passedModel});

  final String itemID;
  final VoidCallback onDelete;
  final CardItemModel passedModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Dismissible(
        background: DeleteAndEditActions(),
        key: ValueKey(itemID),
        onDismissed: (direction) {
          onDelete();
        },
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
