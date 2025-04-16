import 'package:flutter/material.dart';

import '../utils/assets/colors.dart';
import '../utils/assets/images.dart';

class TitleAppBarScreens extends StatelessWidget {
  const TitleAppBarScreens(
      {super.key, required this.firstText, required this.secondText});

  final String firstText;
  final String secondText;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          firstText,
          style: TextStyle(
              color: AppColors.kPrimary,
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
        Text(
          secondText,
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
