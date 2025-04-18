import 'package:flutter/material.dart';

import '../../../../core/utils/assets/fonts.dart';
import '../../../../core/widgets/custom_text.dart';

class RecipeDetailsViewIngredientsSectionLogic {
  static Widget buildIngredientsList(List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.map((item) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Row(
            children: [
              CustomText(text: "• ", style: AppFonts.fontBlack18),
              Expanded(
                  child: CustomText(
                      text: item,
                      style: AppFonts.font16
                          .copyWith(fontWeight: FontWeight.w400))),
            ],
          ),
        );
      }).toList(),
    );
  }
}
