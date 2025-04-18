class RecipeDetailsModel {
  final String step;
  RecipeDetailsModel({required this.step});
  factory RecipeDetailsModel.factoryRecipeDetailsModel(
      Map<String, dynamic> json) {
    return RecipeDetailsModel(
      step: json["step"] ?? "",
    );
  }
}
