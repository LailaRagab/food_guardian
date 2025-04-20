import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_guardian/features/dashboard_feature/dashboard_models/for_passing_item_state_to_dashboard.dart';

import 'card_itme_model.dart';
import 'inventory_category_states.dart';

class InventoryCategoryCubit extends Cubit<InventoryCategoryStates> {
  InventoryCategoryCubit() : super(InitialState());

  final passingStatus =
      ForPassingItemStateToDashboard.forPassingItemStateToDashboard;

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
      emit(InventoryErrorState(
          errorMessage: 'There is an error, ${e.toString()}'));
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
          errorMessage: "Failed to delete item, ${e.toString}"));
    }
  }

  Future<void> updateItem(
      String subCollection,
      String docID,
      String updatedName,
      String updatedQuantity,
      updatedExDate,
      String image) async {
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
        "image": image
      });
      emit(InventoryItemEditedState());
      readStoredItemsInInventoryCategory(subCollection); // Refresh data
    } catch (e) {
      emit(InventoryItemFailedToEditState(
          errorMessage: "Failed to update item"));
    }
  }

  Future<void> updateItemUsedStatus(
      String subCollection, String docID, bool isUsed) async {
    try {
      await FirebaseFirestore.instance
          .collection(CardItemModel.collectionName)
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection(subCollection)
          .doc(docID)
          .update({"isUsed": isUsed});
    } catch (e) {
      emit(InventoryItemFailedToEditState(
          errorMessage: "Failed to update used status"));
    }
  }

  Future<void> countAllUsedItemsAcrossCategories() async {
    emit(InventoryLoadingState());
    List<String> categories = ['Fridge', 'Freezer', 'Pantry'];
    double count = 0;

    try {
      for (String category in categories) {
        final inventoryCollection = FirebaseFirestore.instance
            .collection(CardItemModel.collectionName)
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection(category);

        final snapshot = await inventoryCollection.get(); // One-time read

        for (var doc in snapshot.docs) {
          final item = CardItemModel.fromJson(doc);
          if (item.itemIsUsed == true) {
            count++;
          }
        }
      }
      passingStatus.setUsedCount(count);
    } on Exception catch (e) {
      emit(InventoryErrorState(
          errorMessage: 'There is an error: ${e.toString()}'));
    }
  }
}
