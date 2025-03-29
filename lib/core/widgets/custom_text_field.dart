import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({super.key, required this.label, required this.controller});
  TextEditingController controller = TextEditingController();
  final String label;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(label: Text(label)),
    );
  }
}
