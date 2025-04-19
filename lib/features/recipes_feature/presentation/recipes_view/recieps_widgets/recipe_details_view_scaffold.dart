import 'package:flutter/material.dart';
import 'package:food_guardian/features/recipes_feature/presentation/recipes_view/recieps_widgets/recipe_details_app_bar.dart';
import 'package:food_guardian/features/recipes_feature/presentation/recipes_view/recieps_widgets/recipe_details_view_content_column.dart';
import 'package:food_guardian/features/recipes_feature/recipes_models/recipe_details_model.dart';

import '../../../../../core/utils/assets/colors.dart';

class RecipeDetailsViewScaffold extends StatelessWidget {
  const RecipeDetailsViewScaffold({
    super.key,
    required this.stepsList,
  });
  final List<RecipeDetailsModel> stepsList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kRecipesDetailsBg,
      appBar: RecipeDetailsAppBar(),
      body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
          child: RecipeDetailsViewContentColumn(
            stepsList: stepsList,
          )),
    );
  }
}
