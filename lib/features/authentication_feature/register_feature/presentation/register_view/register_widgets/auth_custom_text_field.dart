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
      onChanged: onChanged,
      obscureText: forSecure,
      decoration: InputDecoration(
          suffixIcon: suffixIcon,
          prefixIcon: preIcon,
          hintText: hintText,
          hintStyle: AppFonts.fontWhite20.copyWith(
              color: AppColors.kTextAuth, fontWeight: FontWeight.w100),
          contentPadding: EdgeInsets.only(left: 50),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: AppColors.kTextAuth),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          )),
    );
  }
}
