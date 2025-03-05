import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_guardian/core/utils/assets/fonts.dart';
import 'package:food_guardian/core/widgets/bg_empty_screens_text.dart';
import 'package:food_guardian/features/authentication_feature/register_feature/presentation/register_view/register_widgets/auth_snack_bar.dart';
import 'package:food_guardian/features/inventory_feature/presentation/inventory_view/inventory_widgets/item_card.dart';
import 'package:food_guardian/features/inventory_feature/presentation/inventory_view_model/inventory_category_cubit.dart';
import 'package:food_guardian/features/inventory_feature/presentation/inventory_view_model/inventory_category_states.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../models/card_itme_model.dart';

class InventoryCategoryBody extends StatelessWidget {
  final String subCollection;
  InventoryCategoryBody({super.key, required this.subCollection});
  List<CardItemModel> itemsList = [];
  bool isLoaded = false;
  @override
  Widget build(BuildContext context) {
    Future.microtask(() => BlocProvider.of<InventoryCategoryCubit>(context)
        .readStoredItemsInInventoryCategory(subCollection));
    return BlocConsumer<InventoryCategoryCubit, InventoryCategoryStates>(
      listener: (context, state) {
        if (state is InventoryLoadingState) {
          isLoaded = true;
        }
        if (state is InventoryAvailableDataState) {
          itemsList = state.itemsList2;
          isLoaded = false;
        }
        if (state is InventoryErrorState) {
          snackBar(context, state.errorMessage);
          isLoaded = false;
        }
        if (state is InventoryItemFailedToDeletedState) {
          snackBar(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        if (state is InventoryAvailableDataState ||
            state is InventoryItemDeletedState) {
          return ModalProgressHUD(
            inAsyncCall: isLoaded,
            child: ListView.builder(
                itemCount: itemsList.length,
                itemBuilder: (context, int index) {
                  return ItemCard(
                    itemID: InventoryCategoryCubit.docID!,
                    passedModel: itemsList[index],
                    subCategory: subCollection,
                  );
                }),
          );
        }
        if (state is InventoryEmptyState) {
          return BgEmptyScreensText(
              top: 0,
              text:
                  "Category is empty now ........... when you add new item it will appear here. ");
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
