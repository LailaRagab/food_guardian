import 'package:flutter/material.dart';
import 'package:food_guardian/core/utils/assets/colors.dart';
import 'package:food_guardian/core/utils/assets/fonts.dart';
import 'package:food_guardian/core/widgets/custom_text.dart';

class CustomElevatedButton extends StatelessWidget {
  CustomElevatedButton(
      {super.key,
      required this.onPressed,
      required this.text,
      this.style,
      this.textStyle});
  final VoidCallback onPressed;
  final String text;
  ButtonStyle? style =
      ElevatedButton.styleFrom(backgroundColor: AppColors.kPrimary);
  TextStyle? textStyle = AppFonts.font14.copyWith(color: AppColors.kBlack);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: style,
        child: CustomText(
            text: text,
            style: textStyle ??
                AppFonts.font14.copyWith(color: AppColors.kBlack)));
  }
}
