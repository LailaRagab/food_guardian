import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_guardian/features/inventory_feature/models/card_itme_model.dart';

class SetItemDetails {
  static void setItemDetails(QueryDocumentSnapshot data) {
    CardItemModel.fromJson(data);
  }
}
