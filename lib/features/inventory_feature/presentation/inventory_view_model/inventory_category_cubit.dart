import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_guardian/features/inventory_feature/presentation/inventory_view_model/inventory_category_states.dart';

import '../../models/card_itme_model.dart';

class InventoryCategoryCubit extends Cubit<InventoryCategoryStates> {
  InventoryCategoryCubit() : super(InitialState());

  void readStoredItemsInInventoryCategory(String subCollection) {
    CollectionReference inventoryCollection = FirebaseFirestore.instance
        .collection(CardItemModel.collectionName)
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection(subCollection);

    try {
      emit(LoadingState());
      inventoryCollection.orderBy("exDate").snapshots().listen((event) {
        if (event.docs.isEmpty) {
          emit(EmptyState()); // Emit EmptyState if there are no items
          return;
        }
        List<CardItemModel> itemsList1 = [];
        for (var doc in event.docs) {
          itemsList1.add(CardItemModel.fromJson(doc));
        }
        emit(AvailableDataState(itemsList2: itemsList1));
      });
    } on Exception catch (e) {
      emit(ErrorState(errorMessage: 'There is an error'));
    }
  }
}
