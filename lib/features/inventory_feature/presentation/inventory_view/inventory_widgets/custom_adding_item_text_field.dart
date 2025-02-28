import 'package:flutter/material.dart';

import '../../../../../core/utils/assets/colors.dart';
import '../../../../../core/utils/assets/fonts.dart';

class CustomAddingItemTextField extends StatelessWidget {
  CustomAddingItemTextField({
    super.key,
    required this.hint,
    required this.onSubmitted,
  });

  final String hint;
  final Function(String) onSubmitted;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onSubmitted,
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
