import 'package:flutter/material.dart';
import 'package:food_guardian/features/recipes_feature/presentation/recipes_view/recieps_widgets/body_recipes_view.dart';
import 'package:food_guardian/features/recipes_feature/presentation/recipes_view_model/detect_food_in_text_api.dart';
import 'package:food_guardian/features/recipes_feature/recipes_models/detect_text_in_food_model.dart';
import 'package:food_guardian/features/recipes_feature/recipes_models/recipes_model.dart';

import '../recipes_view_model/recipes_api_service_logic.dart';

class RecipesView extends StatefulWidget {
  const RecipesView({super.key});

  @override
  State<RecipesView> createState() => _RecipesViewState();
}

class _RecipesViewState extends State<RecipesView> {
  List<RecipesModel> recipes = [];
  List<DetectTextInFoodModel> detectFoodList = [];

  @override
  void initState() {
    getRecipes();
    super.initState();
  }

  Future<void> getRecipes() async {
    final detectFood = await DetectFoodInTextApi.detectFood(context);
    final fetchedRecipes =
        await RecipesApiServiceLogic.fetchRecipesFromApi(context, detectFood);
    setState(() {
      recipes = fetchedRecipes;
      recipes.sort((a, b) => b.matchPercentage.compareTo(a.matchPercentage));
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
