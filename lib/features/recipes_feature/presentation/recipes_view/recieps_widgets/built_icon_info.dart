import 'package:flutter/material.dart';

import '../../../../../core/utils/assets/colors.dart';
import '../../../../../core/utils/assets/fonts.dart';
import '../../../../../core/widgets/custom_text.dart';

class BuiltIconInfo {
  static Widget buildInfoIcon(IconData icon, String label) {
    return Row(
      children: [
        Icon(icon, size: 18, color: Colors.grey[700]),
        const SizedBox(width: 5),
        CustomText(
            text: label,
            style: AppFonts.font16.copyWith(color: AppColors.kGrey))
      ],
    );
  }
}
