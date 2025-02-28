import 'package:flutter/material.dart';
import 'package:food_guardian/core/utils/assets/colors.dart';
import 'package:food_guardian/core/utils/assets/fonts.dart';

class CustomDropDownButton extends StatelessWidget {
  CustomDropDownButton({
    super.key,
    required this.onChanged,
    required this.selectedCategory,
  });

  final ValueChanged<String?> onChanged;

  final String selectedCategory;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      onChanged: onChanged,
      dropdownColor: AppColors.kWhite,
      menuWidth: 100,
      iconEnabledColor: AppColors.kPrimary,
      value: selectedCategory,
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
