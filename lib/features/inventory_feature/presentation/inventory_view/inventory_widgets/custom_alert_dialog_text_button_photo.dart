import 'package:flutter/material.dart';

class CustomAlertDialogTextButtonPhoto extends StatelessWidget {
  const CustomAlertDialogTextButtonPhoto(
      {super.key, required this.icon, required this.onPressed});

  final Icon icon;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: icon,
    );
  }
}
