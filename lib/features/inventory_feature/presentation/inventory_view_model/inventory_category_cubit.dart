import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_guardian/features/inventory_feature/presentation/inventory_view_model/inventory_category_states.dart';

import '../../models/card_itme_model.dart';

class InventoryCategoryCubit extends Cubit<InventoryCategoryStates> {
  InventoryCategoryCubit() : super(InitialState());

  void readStoredItemsInInventoryCategory(String subCollection) {
    emit(InventoryLoadingState());
    CollectionReference inventoryCollection = FirebaseFirestore.instance
        .collection(CardItemModel.collectionName)
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection(subCollection);
    try {
      emit(InventoryLoadingState());
      inventoryCollection.orderBy("exDate").snapshots().listen((event) {
        if (event.docs.isEmpty) {
          emit(InventoryEmptyState()); // Emit EmptyState if there are no items
          return;
        }
        List<CardItemModel> itemsList1 = [];
        for (var doc in event.docs) {
          itemsList1.add(CardItemModel.fromJson(doc));
        }

        emit(InventoryAvailableDataState(itemsList2: itemsList1));
      });
    } on Exception catch (e) {
      emit(InventoryErrorState(errorMessage: 'There is an error'));
    }
  }

  void deleteItem(String subCollection, String docID) {
    try {
      FirebaseFirestore.instance
          .collection(CardItemModel.collectionName)
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection(subCollection)
          .doc(docID)
          .delete();
    } on Exception catch (e) {
      emit(InventoryItemFailedToDeletedState(
          errorMessage: "Failed to delete item"));
    }
  }

  Future<void> updateItem(String subCollection, String docID,
      String updatedName, String updatedQuantity, updatedExDate) async {
    try {
      await FirebaseFirestore.instance
          .collection(CardItemModel.collectionName)
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection(subCollection)
          .doc(docID)
          .update({
        "name": updatedName,
        "quantity": updatedQuantity,
        "exDate": updatedExDate,
      });
      emit(InventoryItemEditedState());
      readStoredItemsInInventoryCategory(subCollection); // Refresh data
    } catch (e) {
      emit(InventoryItemFailedToEditState(
          errorMessage: "Failed to update item"));
    }
  }
}
