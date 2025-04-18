import 'package:flutter/material.dart';
import 'package:food_guardian/features/recipes_feature/presentation/recipes_view/recieps_widgets/recipe_details_view_scaffold.dart';

class RecipesDetailsView extends StatelessWidget {
  const RecipesDetailsView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: RecipeDetailsViewScaffold());
  }
}
