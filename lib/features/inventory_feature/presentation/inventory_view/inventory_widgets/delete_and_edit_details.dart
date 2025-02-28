import 'package:flutter/material.dart';

import '../../../../../core/utils/assets/colors.dart';
import '../../../../../core/utils/assets/fonts.dart';

class DeleteAndEditDetails extends StatelessWidget {
  const DeleteAndEditDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.delete,
              color: AppColors.kWhite,
              size: 30,
            ),
            Text(
              "Delete",
              style: AppFonts.font14,
            )
          ],
        ),
        SizedBox(
          width: 10,
        ),
        VerticalDivider(
          thickness: 1,
          color: AppColors.kWhite,
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              size: 30,
              Icons.edit,
              color: AppColors.kWhite,
            ),
            Text(
              "Edit",
              style: AppFonts.font14,
            )
          ],
        )
      ],
    );
  }
}
