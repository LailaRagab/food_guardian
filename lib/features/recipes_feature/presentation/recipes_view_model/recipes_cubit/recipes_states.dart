class RecipesStates {}

class RecipesSuccess extends RecipesStates {}

class InitialLoadingState extends RecipesStates {}

class RecipesFailure extends RecipesStates {
  String errorMessage;

  RecipesFailure({required this.errorMessage});
}
