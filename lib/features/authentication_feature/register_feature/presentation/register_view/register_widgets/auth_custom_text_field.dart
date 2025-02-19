import 'package:flutter/material.dart';

import '../../../../../../core/utils/assets/colors.dart';
import '../../../../../../core/utils/assets/fonts.dart';

class AuthCustomTextField extends StatelessWidget {
  AuthCustomTextField({super.key, required this.hintText, required this.preIcon, this.suffixIcon, this.forSecure=false});

  final String hintText;
  final Icon preIcon;
  Icon? suffixIcon;
  bool forSecure ;

  @override
  Widget build(BuildContext context) {
    return TextField(
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
