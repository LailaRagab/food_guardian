class DetectTextInFoodModel {
  String tag;
  String annotation;
  DetectTextInFoodModel({required this.tag, required this.annotation});
  factory DetectTextInFoodModel.factoryModel(json) {
    return DetectTextInFoodModel(
        tag: json["tag"], annotation: json["annotation"]);
  }
}
