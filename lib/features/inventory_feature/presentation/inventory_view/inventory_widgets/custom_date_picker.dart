import 'package:flutter/material.dart';
import 'package:food_guardian/core/utils/extensions/date_format_extension.dart';

import '../../../../../core/utils/assets/colors.dart';
import '../../../../../core/utils/assets/fonts.dart';

class CustomDatePicker extends StatelessWidget {
  const CustomDatePicker({
    super.key,
    required this.onTap,
    required this.date,
  });

  final VoidCallback onTap;
  final DateTime date;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 150,
        decoration: BoxDecoration(
            color: AppColors.kUploadButtonBg,
            borderRadius: BorderRadius.all(Radius.circular(35))),
        child: Center(
          child: Text(
            "EX: ${date.dateFormate()}",
            style: AppFonts.fontBlack18,
          ),
        ),
      ),
    );
  }
}
