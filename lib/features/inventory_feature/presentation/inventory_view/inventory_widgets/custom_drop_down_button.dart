import 'package:flutter/material.dart';
import 'package:food_guardian/core/utils/assets/colors.dart';
import 'package:food_guardian/core/utils/assets/fonts.dart';

class CustomDropDownButton extends StatelessWidget {
  const CustomDropDownButton({
    super.key,
    required this.onChanged,
  });

  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Field is required";
        }
      },
      hint: Text(
        "Select Category",
        style: AppFonts.font20HintStyle,
      ),
      onChanged: onChanged,
      dropdownColor: AppColors.kWhite,
      iconEnabledColor: AppColors.kPrimary,
      items: [
        DropdownMenuItem(
          value: "Fridge",
          child: Text(
            "Fridge",
            style: AppFonts.fontBlack18,
          ),
        ),
        DropdownMenuItem(
            value: "Freezer",
            child: Text("Freezer", style: AppFonts.fontBlack18)),
        DropdownMenuItem(
            value: "Pantry",
            child: Text("Pantry", style: AppFonts.fontBlack18)),
      ],
    );
  }
}
