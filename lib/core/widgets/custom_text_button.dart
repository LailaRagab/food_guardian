import 'package:flutter/material.dart';
import 'package:food_guardian/core/widgets/custom_text.dart';

import '../utils/assets/colors.dart';
import '../utils/assets/fonts.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
      {super.key, required this.onPressed, required this.text});
  final VoidCallback onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: CustomText(
            text: text,
            style: AppFonts.font14.copyWith(color: AppColors.kBlack)));
  }
}
