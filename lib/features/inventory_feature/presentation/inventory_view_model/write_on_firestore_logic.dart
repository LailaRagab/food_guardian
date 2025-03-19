import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../models/card_itme_model.dart';

class WriteOnFireStoreLogic {
   static void buildAddItemsToFirestore(
      BuildContext context,
      String category,
      String name,
      quantity,
      DateTime selectedExpirationDate,
      FileImage? image,
      String? barcode) {
    CollectionReference inventoryCollection = FirebaseFirestore.instance
        .collection(CardItemModel.collectionName)
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection(category);

    DocumentReference documentReference = inventoryCollection.doc();
    CardItemModel cardItemModel = CardItemModel(
      docIDForDeleteAndEdit: documentReference.id,
      itemName: name,
      itemQuantity: quantity!,
      itemExpirationDate: selectedExpirationDate,
      itemImage: image,
      itemBarcode: barcode,
    );
    documentReference.set(cardItemModel.toJson());
    Navigator.pop(context);
    // inventoryCollection.add(cardItemModel.toJson());
  }
}
