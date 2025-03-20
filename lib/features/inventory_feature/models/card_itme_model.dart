import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CardItemModel {
  static String collectionName = "InventoryCollection";
  final String docIDForDeleteAndEdit;
  final String itemName;
  final String itemQuantity;
  final DateTime itemExpirationDate;
  final FileImage? itemImage;
  final String? itemBarcode;
  final String? itemImageAPI;

  CardItemModel(
      {required this.itemName,
      required this.itemQuantity,
      required this.itemExpirationDate,
      required this.docIDForDeleteAndEdit,
      required this.itemImage,
      required this.itemBarcode,
      required this.itemImageAPI});

  // Updated factory constructor to accept a QueryDocumentSnapshot directly
  factory CardItemModel.fromJson(QueryDocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>; // Extract data properly
    return CardItemModel(
        docIDForDeleteAndEdit: doc.id, // Use document ID
        itemName: data["name"],
        itemQuantity: data["quantity"],
        itemExpirationDate: (data["exDate"] as Timestamp).toDate(),
        itemImage: data["image"] != null
            ? FileImage(File(data["image"])) // Convert path to FileImage
            : null,
        itemBarcode: data["barcode"],
        itemImageAPI: data["imageAPI"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "docID": docIDForDeleteAndEdit,
      "name": itemName,
      "quantity": itemQuantity,
      "exDate": itemExpirationDate,
      "image": itemImage != null ? itemImage!.file.path : null,
      "barcode": itemBarcode,
      "imageAPI": itemImageAPI
    };
  }
}
