import 'package:flutter/material.dart';
import 'package:food_guardian/features/inventory_feature/presentation/inventory_view/inventory_widgets/delete_and_edit_details.dart';

import '../../../../../core/utils/assets/colors.dart';
import '../../../inventory_models/card_itme_model.dart';

class DeleteAndEditActions extends StatelessWidget {
  const DeleteAndEditActions(
      {super.key,
      required this.subCategory,
      required this.docID,
      required this.item});

  final String subCategory;
  final String docID;
  final CardItemModel item;
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 379,
      // height: 123,
      decoration: BoxDecoration(
        color: AppColors.kRed,
        borderRadius: BorderRadius.all(Radius.circular(35)),
      ),
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: DeleteAndEditDetails(
            subCategory: subCategory,
            docID: docID,
            item: item,
          )),
    );
  }
}
