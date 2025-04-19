class ForPassingSharedDataForRecipesFeature {
  static final ForPassingSharedDataForRecipesFeature obj =
      ForPassingSharedDataForRecipesFeature();

  String? forPassingImage;

  String? get getImage => forPassingImage;

  void setImage(String? value) {
    forPassingImage = value;
  }

  String? forPassingTitle;

  String? get getTitle => forPassingTitle;

  void setTitle(String value) {
    forPassingTitle = value;
  }
}
