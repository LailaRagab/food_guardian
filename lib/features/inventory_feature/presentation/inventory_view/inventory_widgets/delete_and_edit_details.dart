import 'package:flutter/material.dart';
import 'package:food_guardian/features/inventory_feature/presentation/inventory_view/inventory_widgets/delete_action.dart';
import 'package:food_guardian/features/inventory_feature/presentation/inventory_view/inventory_widgets/edit_action.dart';
import 'package:food_guardian/features/inventory_feature/presentation/inventory_view_model/check_box_item_is_used.dart';

import '../../../../../core/utils/assets/colors.dart';
import '../../../inventory_models/card_itme_model.dart';

class DeleteAndEditDetails extends StatefulWidget {
  const DeleteAndEditDetails({
    super.key,
    required this.subCategory,
    required this.docID,
    required this.item,
  });

  final String subCategory;
  final String docID;
  final CardItemModel item;

  @override
  State<DeleteAndEditDetails> createState() => _DeleteAndEditDetailsState();
}

class _DeleteAndEditDetailsState extends State<DeleteAndEditDetails> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DeleteAction(
          subCategory: widget.subCategory,
          docID: widget.docID,
        ),
        SizedBox(width: 10),
        VerticalDivider(thickness: 1, color: AppColors.kWhite),
        SizedBox(width: 10),
        EditAction(
            item: widget.item,
            subCategory: widget.subCategory,
            docID: widget.docID),
        SizedBox(width: 10),
        VerticalDivider(thickness: 1, color: AppColors.kWhite),
        SizedBox(width: 10),
        CheckBoxItemIsUsed(item: widget.item, subCategory: widget.subCategory)
      ],
    );
  }
}
