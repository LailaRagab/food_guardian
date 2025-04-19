import 'package:flutter/material.dart';
import 'package:food_guardian/features/recipes_feature/recipes_models/for_passing_shared_data_for_recipes_feature.dart';
import 'package:food_guardian/features/recipes_feature/recipes_models/recipes_model.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/assets/colors.dart';
import '../../../../../core/utils/assets/fonts.dart';
import '../../../../../core/widgets/custom_elevated_button.dart';
import '../../recipes_view_model/recipe_details_api_service.dart';

class RecipeCardInfoViewRecipeButton extends StatefulWidget {
  const RecipeCardInfoViewRecipeButton({super.key, required this.recipe});
  final RecipesModel recipe;

  @override
  State<RecipeCardInfoViewRecipeButton> createState() =>
      _RecipeCardInfoViewRecipeButtonState();
}

class _RecipeCardInfoViewRecipeButtonState
    extends State<RecipeCardInfoViewRecipeButton> {
  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      onPressed: () async {
        ForPassingSharedDataForRecipesFeature.obj.setImage(widget.recipe.image);
        ForPassingSharedDataForRecipesFeature.obj.setTitle(widget.recipe.name);
        final steps = await RecipeDetailsApiService.getRecipeDetails(
            widget.recipe.id, context);

        if (steps.isNotEmpty && context.mounted) {
          GoRouter.of(context).push("/recipesDetails", extra: steps);
        }
      },
      text: "View Recipe",
      textStyle: AppFonts.font14,
      style: ElevatedButton.styleFrom(backgroundColor: AppColors.kPrimary),
    );
  }
}
