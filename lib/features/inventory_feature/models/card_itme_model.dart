class CardItemModel {
  static String collectionName = "InventoryCollection";
  // String id;
  String itemName;
  String itemQuantity;
  DateTime itemExpirationDate;
  // String itemCategory;

  CardItemModel({
    // required this.id,
    required this.itemName,
    required this.itemQuantity,
    required this.itemExpirationDate,
    // required this.itemCategory,
  });

  Map<String, dynamic> toJson() {
    return {
      // "userID": id,
      "name": itemName,
      "quantity": itemQuantity,
      "exDate": itemExpirationDate,
      // "category": itemCategory,
    };
  }
}
