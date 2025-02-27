import 'package:flutter/material.dart';
import 'package:food_guardian/core/utils/assets/colors.dart';
import 'package:food_guardian/core/utils/assets/fonts.dart';

class CustomDropDownButton extends StatefulWidget {
  const CustomDropDownButton({super.key});

  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  String selectedCategory = "Fridge";

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
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
        onChanged: (newValue) {
          setState(() {
            selectedCategory = newValue!;
          });
        });
  }
}
