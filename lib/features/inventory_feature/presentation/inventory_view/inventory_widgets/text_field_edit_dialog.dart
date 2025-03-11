import 'package:flutter/material.dart';

class TextFieldEditDialog extends StatelessWidget {
  const TextFieldEditDialog(
      {super.key, required this.controller, required this.label, this.getName});

  final TextEditingController controller;
  final String label;
  final TextEditingController? getName;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (anyInputs) {
        if (anyInputs!.isEmpty) {
          return "Field is required";
        }
        if (getName != null &&
            !RegExp(r'^[a-zA-Z\s]+$').hasMatch(getName!.text)) {
          return 'Name can only contain letters';
        }
      },
      controller: controller,
      decoration: InputDecoration(labelText: label),
    );
  }
}
