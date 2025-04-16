import 'package:flutter/material.dart';
import 'package:food_guardian/core/utils/assets/colors.dart';
import 'package:food_guardian/core/utils/assets/fonts.dart';
import 'package:food_guardian/core/widgets/custom_text.dart';
import 'package:food_guardian/core/widgets/custom_elevated_button.dart';
import 'package:food_guardian/features/recipes_feature/presentation/recipes_view/recieps_widgets/body_recipes_view.dart';
import 'package:food_guardian/features/recipes_feature/recipes_models/recipes_model.dart';

import '../../recipes_models/recipes_api_service_logic.dart';

class RecipesView extends StatefulWidget {
  const RecipesView({super.key});

  @override
  State<RecipesView> createState() => _RecipesViewState();
}

class _RecipesViewState extends State<RecipesView> {
  List<RecipesModel> recipes = [];
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  Future<void> getRecipes() async {
    final fetchedRecipes =
        await RecipesApiServiceLogic.fetchRecipesFromApi(context);
    setState(() {
      recipes = fetchedRecipes as List<RecipesModel>;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BodyRecipesView(recipes: recipes),
      ),
    );
  }
}
