class RecipesModel {
  String id;
  String name;
  String? image;
  List<String> missIngredients;

  RecipesModel(
      {required this.id,
      required this.name,
      required this.image,
      required this.missIngredients});

  factory RecipesModel.model(Map<String, dynamic> json) {
    return RecipesModel(
      id: json["id"].toString(),
      name: json["title"],
      image: json["image"],
      missIngredients: List<String>.from(
        (json["missedIngredients"] as List).map((item) => item["name"]),
      ),
    );
  }
}
