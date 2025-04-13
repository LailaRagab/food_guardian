import 'package:cloud_firestore/cloud_firestore.dart';

class CardItemModel {
  static String collectionName = "InventoryCollection";
  final String docIDForDeleteAndEdit;
  final String? itemName;
  final String? itemQuantity;
  final DateTime itemExpirationDate;
  final String? itemImage;
  final String? itemBarcode;
  // final String? itemImageAPI;

  CardItemModel({
    required this.itemName,
    required this.itemQuantity,
    required this.itemExpirationDate,
    required this.docIDForDeleteAndEdit,
    required this.itemImage,
    required this.itemBarcode,
  });

  // Updated factory constructor to accept a QueryDocumentSnapshot directly
  factory CardItemModel.fromJson(QueryDocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>; // Extract data properly
    return CardItemModel(
      docIDForDeleteAndEdit: doc.id, // Use document ID
      itemName: data["name"],
      itemQuantity: data["quantity"],
      itemExpirationDate: (data["exDate"] as Timestamp).toDate(),
      itemImage: data["image"],
      itemBarcode: data["barcode"],
      // itemImageAPI: data["imageAPI"]
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "docID": docIDForDeleteAndEdit,
      "name": itemName,
      "quantity": itemQuantity,
      "exDate": itemExpirationDate,
      "image": itemImage,
      "barcode": itemBarcode,
    };
  }
}
