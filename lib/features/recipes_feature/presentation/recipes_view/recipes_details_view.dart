import 'package:flutter/material.dart';
import 'package:food_guardian/features/recipes_feature/presentation/recipes_view/recieps_widgets/recipe_details_view_scaffold.dart';
import 'package:food_guardian/features/recipes_feature/recipes_models/recipe_details_model.dart';

class RecipesDetailsView extends StatelessWidget {
  const RecipesDetailsView({
    super.key,
    required this.stepsList,
  });
  final List<RecipeDetailsModel> stepsList;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: RecipeDetailsViewScaffold(
      stepsList: stepsList,
    ));
  }
}
