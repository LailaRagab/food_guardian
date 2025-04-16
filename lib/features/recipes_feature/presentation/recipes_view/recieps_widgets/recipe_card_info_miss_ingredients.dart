import 'package:flutter/material.dart';
import 'package:food_guardian/features/recipes_feature/recipes_models/recipes_model.dart';

import '../../../../../core/utils/assets/colors.dart';
import '../../../../../core/utils/assets/fonts.dart';
import '../../../../../core/widgets/custom_text.dart';

class RecipeCardInfoMissIngredients extends StatelessWidget {
  const RecipeCardInfoMissIngredients({super.key, required this.recipe});
  final RecipesModel recipe;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: "Missing Ingredients:",
          style: AppFonts.font14.copyWith(color: AppColors.kPrimary),
        ),
        const SizedBox(height: 4),
        Wrap(
          spacing: 6,
          children: (recipe.missIngredients as List<String>)
              .map((item) => Chip(
                    label: Text(item),
                    backgroundColor: Colors.grey[200],
                    labelStyle: AppFonts.font12,
                  ))
              .toList(),
        ),
      ],
    );
  }
}
