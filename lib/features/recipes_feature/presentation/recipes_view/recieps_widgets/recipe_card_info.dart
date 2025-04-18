import 'package:flutter/material.dart';
import 'package:food_guardian/features/recipes_feature/presentation/recipes_view/recieps_widgets/recipe_card_info_match_row.dart';
import 'package:food_guardian/features/recipes_feature/presentation/recipes_view/recieps_widgets/recipe_card_info_miss_ingredients.dart';
import 'package:food_guardian/features/recipes_feature/presentation/recipes_view/recieps_widgets/recipe_card_info_view_recipe_button.dart';
import 'package:food_guardian/features/recipes_feature/recipes_models/recipes_model.dart';
import '../../../../../core/utils/assets/fonts.dart';
import '../../../../../core/widgets/custom_text.dart';

class RecipeCardInfo extends StatelessWidget {
  const RecipeCardInfo({super.key, required this.recipe});
  final RecipesModel recipe;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(text: recipe.name, style: AppFonts.fontBlack18),
        const SizedBox(height: 6),
        RecipeCardInfoMatchRow(),
        const SizedBox(height: 10),
        if (recipe.missIngredients != null &&
            (recipe.missIngredients as List).isNotEmpty)
          RecipeCardInfoMissIngredients(recipe: recipe),
        RecipeCardInfoViewRecipeButton(
          recipe: recipe,
        )
      ],
    );
  }
}
