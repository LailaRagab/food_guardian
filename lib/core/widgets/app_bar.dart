import 'package:flutter/material.dart';
import 'package:food_guardian/core/utils/assets/images.dart';
import 'package:food_guardian/core/widgets/title_app_bar_screens.dart';

import '../utils/assets/colors.dart';

class TheAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TheAppBar({super.key});

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
        title: TitleAppBarScreens());
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(70);
}
