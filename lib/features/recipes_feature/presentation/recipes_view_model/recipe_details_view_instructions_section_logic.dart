import 'package:flutter/material.dart';

import '../../../../core/utils/assets/colors.dart';
import '../../../../core/utils/assets/fonts.dart';
import '../../../../core/widgets/custom_text.dart';

class RecipeDetailsViewInstructionsSectionLogic {
  static Widget buildStepsList(List<String> steps) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: steps.asMap().entries.map((entry) {
        final index = entry.key + 1;
        final step = entry.value;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                  radius: 14,
                  backgroundColor: AppColors.kPrimary,
                  child: CustomText(text: "$index", style: AppFonts.font14)),
              const SizedBox(width: 10),
              Expanded(
                  child: CustomText(
                      text: step,
                      style: AppFonts.font16
                          .copyWith(fontWeight: FontWeight.w400))),
            ],
          ),
        );
      }).toList(),
    );
  }
}
