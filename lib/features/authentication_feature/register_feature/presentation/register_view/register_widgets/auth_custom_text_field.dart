import 'package:flutter/material.dart';

import '../../../../../../core/utils/assets/colors.dart';
import '../../../../../../core/utils/assets/fonts.dart';

class AuthCustomTextFormField extends StatelessWidget {
  AuthCustomTextFormField(
      {super.key,
      required this.hintText,
      required this.preIcon,
      this.suffixIcon,
      this.forSecure = false,
      this.onChanged});

  final String hintText;
  final Icon preIcon;
  Icon? suffixIcon;
  bool forSecure;
  Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (anyInput) {
        if (anyInput!.isEmpty) {
          return "Field is required";
        }
      },
      cursorColor: AppColors.kHintText,
      onChanged: onChanged,
      obscureText: forSecure,
      decoration: InputDecoration(
          suffixIcon: suffixIcon,
          prefixIcon: preIcon,
          hintText: hintText,
          hintStyle: AppFonts.font20HintStyle,
          contentPadding: EdgeInsets.only(left: 50),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: AppColors.kHintText),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          )),
    );
  }
}
