import 'package:food_guardian/features/recipes_feature/recipes_models/recipes_model.dart';

class ForPassingRecipeObjFromRecipesModel {
  static final ForPassingRecipeObjFromRecipesModel recipeModelObj =
      ForPassingRecipeObjFromRecipesModel();

  RecipesModel? recipesModel;

  RecipesModel? get getRecipesModel => recipesModel;

  void setRecipesModel(RecipesModel value) {
    recipesModel = value;
  }
}
