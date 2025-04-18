import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/assets/colors.dart';
import '../../../../../core/utils/assets/fonts.dart';
import '../../../../../core/widgets/custom_elevated_button.dart';
import '../../../recipes_models/recipes_model.dart';
import '../../recipes_view_model/recipe_details_api_service.dart';

class RecipeCardInfoViewRecipeButton extends StatelessWidget {
  const RecipeCardInfoViewRecipeButton({super.key, required this.recipe});
  final RecipesModel recipe;

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      onPressed: () async {
        final recipeDetails =
            await RecipeDetailsApiService.getRecipeDetails(recipe.id, context);
        if (context.mounted) {
          GoRouter.of(context).push(
            "/recipesDetails",
            // extra: recipeDetails,
          );
        }
      },
      text: "View Recipe",
      textStyle: AppFonts.font14,
      style: ElevatedButton.styleFrom(backgroundColor: AppColors.kPrimary),
    );
  }
}
