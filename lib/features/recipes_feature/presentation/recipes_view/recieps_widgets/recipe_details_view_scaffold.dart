import 'package:flutter/material.dart';
import 'package:food_guardian/features/recipes_feature/presentation/recipes_view/recieps_widgets/recipe_details_app_bar.dart';
import 'package:food_guardian/features/recipes_feature/presentation/recipes_view/recieps_widgets/recipe_details_view_content_column.dart';

import '../../../../../core/utils/assets/colors.dart';

class RecipeDetailsViewScaffold extends StatelessWidget {
  const RecipeDetailsViewScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kRecipesDetailsBg,
      appBar: RecipeDetailsAppBar(),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: RecipeDetailsViewContentColumn()),
    );
  }
}
