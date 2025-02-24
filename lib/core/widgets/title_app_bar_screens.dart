import 'package:flutter/material.dart';

import '../utils/assets/colors.dart';
import '../utils/assets/images.dart';

class TitleAppBarScreens extends StatelessWidget {
  const TitleAppBarScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Food",
          style: TextStyle(
              color: AppColors.kPrimary,
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
        Text(
          "Guardian",
          style: TextStyle(
              color: AppColors.kDarkGrey,
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
        Image(
          image: AssetImage(AppImages.logoIcon),
          width: 30,
          height: 30,
        )
      ],
    );
  }
}
