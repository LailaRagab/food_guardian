import 'package:flutter/material.dart';

import '../../../../../core/utils/assets/colors.dart';
import '../../../../../core/utils/assets/fonts.dart';
import '../../../../../core/widgets/custom_text.dart';

class RecipeCardInfoMatchRow extends StatelessWidget {
  const RecipeCardInfoMatchRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.percent, size: 18, color: AppColors.kPrimary),
        const SizedBox(width: 4),
        CustomText(
            text: "Match: %",
            style: AppFonts.font14.copyWith(color: AppColors.kGrey))
      ],
    );
  }
}
