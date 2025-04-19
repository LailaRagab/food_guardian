class RecipesModel {
  String id;
  String name;
  String? image;
  List<String> missIngredients;
  int missedIngredientsCount;
  int usedIngredientsCount;
  double matchPercentage;

  RecipesModel({
    required this.id,
    required this.name,
    required this.image,
    required this.missIngredients,
    required this.missedIngredientsCount,
    required this.usedIngredientsCount,
    required this.matchPercentage,
  });

  factory RecipesModel.model(Map<String, dynamic> json) {
    int missed = json["missedIngredientCount"] ?? 0;
    int used = json["usedIngredientCount"] ?? 0;
    int total = missed + used;
    // Avoid division by zero
    double matchPercent =
        total == 0 ? 0.0 : double.parse((used / total).toStringAsFixed(2));
    return RecipesModel(
      id: json["id"].toString(),
      name: json["title"],
      image: json["image"],
      missIngredients: List<String>.from(
        (json["missedIngredients"] as List).map((item) => item["name"]),
      ).toList(),
      matchPercentage: matchPercent,
      missedIngredientsCount: missed,
      usedIngredientsCount: used,
    );
  }
}
