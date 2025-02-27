import 'package:flutter/material.dart';
import 'package:food_guardian/core/utils/assets/colors.dart';
import 'package:food_guardian/core/utils/assets/fonts.dart';

class CustomSmallButton extends StatelessWidget {
  const CustomSmallButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.kTransparent,
      child: InkWell(
        child: Container(
          width: 80,
          height: 40,
          decoration: BoxDecoration(
              color: AppColors.kPrimary,
              borderRadius: BorderRadius.all(Radius.circular(35))),
          child: Center(
            child: Text(
              "Done",
              style: AppFonts.fontWhite20,
            ),
          ),
        ),
      ),
    );
  }
}
