class RecipesDetailsStates {}

class InitialLoadingDetailsState extends RecipesDetailsStates {}

class RecipeDetailsSuccessful extends RecipesDetailsStates {}

class RecipeDetailsFailure extends RecipesDetailsStates {
  String errorMessage;

  RecipeDetailsFailure({required this.errorMessage});
}
