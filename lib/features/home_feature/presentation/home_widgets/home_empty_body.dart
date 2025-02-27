import 'package:flutter/material.dart';
import 'package:food_guardian/core/utils/assets/fonts.dart';

import '../../../../core/utils/assets/images.dart';

class HomeEmptyBody extends StatelessWidget {
  const HomeEmptyBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage(AppImages.bgHome),
        fit: BoxFit.fill,
      )),
      child: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.only(top: 100, right: 30, left: 30),
          child: Text(
            "Hello, you will see your food list that is about to expire.",
            style: AppFonts.fontGrey20,
          ),
        ),
      ),
    );
  }
}
