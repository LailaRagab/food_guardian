import 'package:flutter/material.dart';
import 'package:food_guardian/features/recipes_feature/recipes_models/recipes_model.dart';

import '../../../../../core/utils/assets/colors.dart';
import '../../../../../core/utils/assets/fonts.dart';
import '../../../../../core/widgets/custom_text.dart';

class RecipeCardInfoMatchRow extends StatelessWidget {
  const RecipeCardInfoMatchRow({super.key, required this.recipe});
  final RecipesModel recipe;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.percent, size: 18, color: AppColors.kPrimary),
        const SizedBox(width: 4),
        CustomText(
            text: "Match: ${recipe.matchPercentage.toString()}%",
            style: AppFonts.font14.copyWith(color: AppColors.kGrey))
      ],
    );
  }
}
