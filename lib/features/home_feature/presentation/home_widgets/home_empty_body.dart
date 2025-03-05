import 'package:flutter/material.dart';
import 'package:food_guardian/core/utils/assets/fonts.dart';
import 'package:food_guardian/core/widgets/bg_empty_screens_text.dart';

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
      child: BgEmptyScreensText(
          top: 80,
          text: "Hello, you will see your food list that is about to expire."),
    );
  }
}
