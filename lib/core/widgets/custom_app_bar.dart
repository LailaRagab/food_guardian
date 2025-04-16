import 'package:flutter/material.dart';
import 'package:food_guardian/core/utils/assets/images.dart';
import 'package:food_guardian/core/widgets/title_app_bar_screens.dart';

import '../utils/assets/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {super.key, required this.firstText, required this.secondText});

  final String firstText;
  final String secondText;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 4,
        shadowColor: AppColors.kPrimary,
        backgroundColor: AppColors.kWhite,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(35),
              bottomRight: Radius.circular(35)),
        ),
        title: TitleAppBarScreens(
          firstText: firstText,
          secondText: secondText,
        ));
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(70);
}
