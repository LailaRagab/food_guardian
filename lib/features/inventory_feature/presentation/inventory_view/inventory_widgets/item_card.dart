import 'package:flutter/material.dart';
import 'package:food_guardian/features/inventory_feature/presentation/inventory_view/inventory_widgets/delete_and_edit_actions.dart';
import 'package:food_guardian/features/inventory_feature/presentation/inventory_view/inventory_widgets/item_card_details.dart';

import '../../../../../core/utils/assets/colors.dart';
import '../../../inventory_models/card_itme_model.dart';

class ItemCard extends StatefulWidget {
  const ItemCard(
      {super.key,
      required this.docID,
      required this.passedModel,
      required this.subCategory});

  final String docID;

  final CardItemModel passedModel;

  final String subCategory;

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Dismissible(
        movementDuration: Duration(seconds: 10),
        direction: DismissDirection.startToEnd,
        background: DeleteAndEditActions(
          subCategory: widget.subCategory,
          docID: widget.docID,
          item: widget.passedModel,
        ),
        key: ValueKey(widget.docID),
        confirmDismiss: (direction) async => false,
        child: Container(
            width: 379,
            height: 123,
            decoration: BoxDecoration(
                color: AppColors.kItemCardBg,
                borderRadius: BorderRadius.all(Radius.circular(35))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ItemCardDetails(
                model: widget.passedModel,
              ),
            )),
      ),
    );
  }
}
