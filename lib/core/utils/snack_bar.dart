import 'package:flutter/material.dart';

void snackBar(BuildContext context, String text, SnackBarAction? action) {
  Future.delayed(const Duration(microseconds: 1), () {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        action: action,
        duration:
            const Duration(seconds: 8), // How long the SnackBar is visible
      ),
    );
  });
}
