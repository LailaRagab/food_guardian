import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/helpers/helper_for_fetch_fun.dart';
import '../../../notifications_feature/notifications_models/for_passing_switch_state.dart';
import '../../../notifications_feature/notifications_models/store_notifications_using_hive.dart';
import '../../inventory_models/card_itme_model.dart';

class WriteOnFireStoreLogic {
  static void buildAddItemsToFirestore(
      BuildContext context,
      String category,
      String? name,
      String? quantity,
      DateTime selectedExpirationDate,
      String? image,
      String? barcode,
      bool isUsed) {
    CollectionReference inventoryCollection = FirebaseFirestore.instance
        .collection(CardItemModel.collectionName)
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection(category);

    // Firestore has a caching mechanismxc to avoid unnecessary reloads
    FirebaseFirestore.instance.settings = const Settings(
      persistenceEnabled: true,
    );

    DocumentReference documentReference = inventoryCollection.doc();
    CardItemModel cardItemModel = CardItemModel(
      docIDForDeleteAndEdit: documentReference.id,
      itemName: name,
      itemQuantity: quantity,
      itemExpirationDate: selectedExpirationDate,
      itemImage: image,
      itemBarcode: barcode,
      itemIsUsed: isUsed,
    );
    documentReference.set(cardItemModel.toJson());
    Navigator.pop(context);
    NotificationModel.clearLocalNotifications();
    if (ForPassingSwitchState.instance.getSwitchValue) {
      scheduleAllNotifications();
    }
    // inventoryCollection.add(cardItemModel.toJson());
  }
}
