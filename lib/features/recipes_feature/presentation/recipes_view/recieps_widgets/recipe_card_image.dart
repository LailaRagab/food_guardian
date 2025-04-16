import 'package:flutter/material.dart';
import 'package:food_guardian/features/recipes_feature/recipes_models/recipes_model.dart';

class RecipeCardImage extends StatelessWidget {
  const RecipeCardImage({super.key, required this.recipe});

  final RecipesModel recipe;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(35)),
      child: recipe.image != null
          ? Image.network(
              recipe.image!,
              errorBuilder: (BuildContext context, error, stackTrace) {
                return Image.asset("assets/images/recipe_image_not_found.png");
              },
              width: double.infinity,
              height: 180,
              fit: BoxFit.cover,
            )
          : Image.asset(
              'assets/images/default_recipe.png',
              width: double.infinity,
              height: 180,
              fit: BoxFit.cover,
            ),
    );
  }
}
