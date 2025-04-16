class ForPassingExpireIngredient {
  static ForPassingExpireIngredient instance = ForPassingExpireIngredient();

  Set<String> ingredients = {};
  void addIngredient(String ingredient) {
    ingredients.add(ingredient);
  }

  String get getIngredients => ingredients.join();

  void clearIngredients() {
    ingredients.clear();
  }
}
