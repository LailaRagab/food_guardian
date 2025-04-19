import 'package:flutter/material.dart';
import 'package:food_guardian/features/inventory_feature/presentation/inventory_view_model/delete_logic.dart';

import '../../../../../core/utils/assets/colors.dart';
import '../../../../../core/utils/assets/fonts.dart';

class DeleteAction extends StatelessWidget {
  const DeleteAction(
      {super.key, required this.subCategory, required this.docID});

  final String subCategory;
  final String docID;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            DeleteLogic().deleteShowDialog(context, subCategory, docID);
          },
          child: Icon(
            Icons.delete,
            color: AppColors.kWhite,
            size: 30,
          ),
        ),
        Text(
          "Delete",
          style: AppFonts.font14,
        )
      ],
    );
  }
}
