import 'package:flutter/material.dart';

import '../../../../../core/utils/assets/colors.dart';
import '../../../../../core/utils/assets/fonts.dart';
import '../../../../../core/utils/assets/images.dart';

class ItemCardDetails extends StatelessWidget {
  const ItemCardDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 15,
        ),
        VerticalDivider(
          indent: 25,
          endIndent: 25,
          thickness: 2,
          color: AppColors.kPrimary,
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Name: Candy",
              style: AppFonts.font16,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "Quantity: 60 kg",
              style: AppFonts.font16,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "Expiration date: 11-4-2025",
              style: AppFonts.font16
                  .copyWith(color: AppColors.kDarkGrey, fontSize: 12),
            ),
          ],
        ),
        SizedBox(
          width: 70,
        ),
        Image(
          image: AssetImage(AppImages.logoIcon),
          width: 77,
          height: 70,
        ),
      ],
    );
  }
}
