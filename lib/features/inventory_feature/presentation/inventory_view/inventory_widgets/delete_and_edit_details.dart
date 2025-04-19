import 'package:flutter/material.dart';
import 'package:food_guardian/features/inventory_feature/presentation/inventory_view/inventory_widgets/delete_action.dart';
import 'package:food_guardian/features/inventory_feature/presentation/inventory_view/inventory_widgets/edit_action.dart';

import '../../../../../core/utils/assets/colors.dart';
import '../../../models/card_itme_model.dart';

class DeleteAndEditDetails extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Row(
      children: [
        DeleteAction(
          subCategory: subCategory,
          docID: docID,
        ),
        SizedBox(width: 10),
        VerticalDivider(thickness: 1, color: AppColors.kWhite),
        SizedBox(width: 10),
        EditAction(item: item, subCategory: subCategory, docID: docID)
      ],
    );
  }
}
