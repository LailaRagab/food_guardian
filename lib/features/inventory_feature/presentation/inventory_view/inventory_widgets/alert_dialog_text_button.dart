import 'package:flutter/material.dart';
import 'package:food_guardian/core/utils/assets/fonts.dart';

class AlertDialogTextButton extends StatelessWidget {
  const AlertDialogTextButton(
      {super.key, required this.text, required this.onTap});

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onTap,
        child: Text(
          text,
          style: AppFonts.fontBlack18,
        ));
  }
}
