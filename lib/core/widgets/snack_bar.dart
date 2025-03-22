import 'package:flutter/material.dart';

void snackBar(BuildContext context, text, SnackBarAction? action) {
  ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text(text), action: action));
}
