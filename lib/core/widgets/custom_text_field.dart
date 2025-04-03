import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      required this.label,
      required this.controller,
      this.obscureText = false});
  TextEditingController controller = TextEditingController();
  final String label;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(label: Text(label)),
      obscureText: obscureText,
    );
  }
}
