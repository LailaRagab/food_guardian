import 'package:flutter/material.dart';
import 'package:food_guardian/features/recipes_feature/presentation/recipes_view/recieps_widgets/recipe_card.dart';
import 'package:food_guardian/features/recipes_feature/recipes_models/for_passing_recipe_obj_from_recipes_model.dart';
import 'package:food_guardian/features/recipes_feature/recipes_models/recipes_model.dart';

class BodyRecipesView extends StatelessWidget {
  const BodyRecipesView({super.key, required this.recipes});

  final List<RecipesModel> recipes;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                RecipesModel recipe = recipes[index];
                ForPassingRecipeObjFromRecipesModel.recipeModelObj
                    .setRecipesModel(recipe);
                return RecipeCard(
                  recipe: recipe,
                );
              },
              childCount: recipes.length,
            ),
          ),
        ),
      ],
    );
  }
}
