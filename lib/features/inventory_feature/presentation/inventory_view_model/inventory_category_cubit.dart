import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_guardian/features/inventory_feature/presentation/inventory_view_model/inventory_category_states.dart';

import '../../../../core/utils/assets/colors.dart';
import '../../models/card_itme_model.dart';
import '../inventory_view/inventory_widgets/custom_add_manually_bottom_sheet.dart';

class InventoryCategoryCubit extends Cubit<InventoryCategoryStates> {
  InventoryCategoryCubit() : super(InitialState());
  static String? docID;

  void readStoredItemsInInventoryCategory(String subCollection) {
    emit(InitialState());
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
          docID = doc.id;
        }
        emit(InventoryAvailableDataState(itemsList2: itemsList1));
      });
    } on Exception catch (e) {
      emit(InventoryErrorState(errorMessage: 'There is an error'));
    }
  }

  void deleteItem(String subCollection) {
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

  void editItem(String subCollection, BuildContext context) {
    FirebaseFirestore.instance
        .collection(CardItemModel.collectionName)
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection(subCollection)
        .doc(docID)
        .update({});
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      backgroundColor: AppColors.kTransparent,
      context: context,
      builder: (context) {
        return CustomAddManuallyBottomSheet();
      },
    );
  }
}
