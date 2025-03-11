import 'package:flutter/material.dart';
import 'package:food_guardian/core/utils/extensions/date_format_extension.dart';
import '../../../../../core/utils/assets/fonts.dart';

class CustomDatePickerTextField extends StatelessWidget {
  CustomDatePickerTextField({
    super.key,
    required this.onTap,
    this.date,
  }) {
    if (date != null) {
      dateText.text = date!.dateFormate();
    }
  }

  final VoidCallback onTap;
  DateTime? date;
  late TextEditingController dateText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (date) {
        if (date == null || date.isEmpty) {
          return "Field is required";
        }
      },
      onTap: onTap,
      controller: dateText,
      readOnly: true,
      decoration: InputDecoration(
          hintText: "Select Expiration Date",
          hintStyle: AppFonts.font20HintStyle),
      style: AppFonts.fontBlack18,
    );
  }
}
