import 'package:flutter/material.dart';
import 'package:food_guardian/core/utils/assets/images.dart';
import 'package:food_guardian/features/recipes_feature/recipes_models/for_passing_recipe_obj_from_recipes_model.dart';
import 'package:food_guardian/features/recipes_feature/recipes_models/recipes_model.dart';

class CustomClipRRect extends StatelessWidget {
  CustomClipRRect({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final recipeModel =
        ForPassingRecipeObjFromRecipesModel.recipeModelObj.getRecipesModel;

    final imageUrl = recipeModel?.image;

    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(35)),
      child: imageUrl != null
          ? Image.network(
              imageUrl,
              errorBuilder: (BuildContext context, error, stackTrace) {
                return Image.asset(AppImages.recipeImageNotFound);
              },
              width: double.infinity,
              height: 180,
              fit: BoxFit.cover,
            )
          : Image.asset(
              AppImages.recipeImageNotFound,
              width: double.infinity,
              height: 180,
              fit: BoxFit.cover,
            ),
    );
  }
}
