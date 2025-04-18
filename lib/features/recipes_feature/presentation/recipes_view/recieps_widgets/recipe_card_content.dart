import 'package:flutter/material.dart';
import 'package:food_guardian/features/recipes_feature/presentation/recipes_view/recieps_widgets/custom_clip_r_rect.dart';
import 'package:food_guardian/features/recipes_feature/presentation/recipes_view/recieps_widgets/recipe_card_info.dart';
import 'package:food_guardian/features/recipes_feature/recipes_models/recipes_model.dart';

class RecipeCardContent extends StatelessWidget {
  const RecipeCardContent({super.key, required this.recipe});
  final RecipesModel recipe;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomClipRRect(),
        Padding(
            padding: const EdgeInsets.all(12),
            child: RecipeCardInfo(recipe: recipe))
      ],
    );
  }
}
