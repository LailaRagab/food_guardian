import 'package:flutter/material.dart';

import '../../../../../core/utils/assets/colors.dart';
import '../../../../../core/utils/assets/fonts.dart';

class CustomAddingItemTextField extends StatelessWidget {
  const CustomAddingItemTextField({super.key, required this.hint});

  final String hint;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: AppColors.kHintText,
      decoration: InputDecoration(
          hintText: hint,
          hintStyle: AppFonts.font20HintStyle,
          border: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.kHintText)),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.kHintText))),
    );
  }
}
