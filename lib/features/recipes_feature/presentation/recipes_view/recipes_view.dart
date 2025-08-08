import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_guardian/core/utils/snack_bar.dart';
import 'package:food_guardian/features/recipes_feature/presentation/recipes_view/recieps_widgets/body_recipes_view.dart';
import 'package:food_guardian/features/recipes_feature/presentation/recipes_view_model/detect_food_in_text_api.dart';
import 'package:food_guardian/features/recipes_feature/presentation/recipes_view_model/recipes_cubit/recipes_cubit.dart';
import 'package:food_guardian/features/recipes_feature/recipes_models/detect_text_in_food_model.dart';
import 'package:food_guardian/features/recipes_feature/recipes_models/recipes_model.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../recipes_view_model/recipes_cubit/recipes_states.dart';

class RecipesView extends StatefulWidget {
  const RecipesView({super.key});

  @override
  State<RecipesView> createState() => _RecipesViewState();
}

class _RecipesViewState extends State<RecipesView> {
  List<RecipesModel> recipes = [];
  List<DetectTextInFoodModel> detectFoodList = [];
  bool isLoaded = false;

  @override
  void initState() {
    getRecipes();
    super.initState();
  }

  Future<void> getRecipes() async {
    final detectFood = await DetectFoodInTextApi.detectFood(context);
    final fetchedRecipes = await BlocProvider.of<RecipesCubit>(context)
        .fetchRecipesFromApi(context, detectFood);
    setState(() {
      recipes = fetchedRecipes;
      recipes.sort((a, b) => b.matchPercentage.compareTo(a.matchPercentage));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<RecipesCubit, RecipesStates>(
        builder: (BuildContext context, state) {
          return ModalProgressHUD(
            inAsyncCall: isLoaded,
            child: Scaffold(
              body: BodyRecipesView(recipes: recipes),
            ),
          );
        },
        listener: (BuildContext context, state) {
          if (state is InitialLoadingState) {
            isLoaded = true;
          }
          if (state is RecipesSuccess) {
            isLoaded = false;
          }
          if (state is RecipesFailure) {
            snackBar(context, state.errorMessage, null);
            isLoaded = false;
          }
        },
      ),
    );
  }
}
