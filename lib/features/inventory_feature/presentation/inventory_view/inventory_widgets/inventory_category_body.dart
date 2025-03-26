import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_guardian/core/widgets/bg_empty_screens_text.dart';
import 'package:food_guardian/core/utils/snack_bar.dart';
import 'package:food_guardian/features/inventory_feature/presentation/inventory_view/inventory_widgets/item_card.dart';
import 'package:food_guardian/features/inventory_feature/presentation/inventory_view_model/inventory_category_cubit.dart';
import 'package:food_guardian/features/inventory_feature/presentation/inventory_view_model/inventory_category_states.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../models/card_itme_model.dart';

class InventoryCategoryBody extends StatefulWidget {
  final String subCollection;
  const InventoryCategoryBody({super.key, required this.subCollection});

  @override
  State<InventoryCategoryBody> createState() => _InventoryCategoryBodyState();
}

class _InventoryCategoryBodyState extends State<InventoryCategoryBody> {
  List<CardItemModel> itemsList = [];
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    // Trigger reading the data only once when the widget is first created
    Future.microtask(() => BlocProvider.of<InventoryCategoryCubit>(context)
        .readStoredItemsInInventoryCategory(widget.subCollection));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InventoryCategoryCubit, InventoryCategoryStates>(
      listener: (context, state) {
        if (state is InventoryLoadingState) {
          setState(() {
            isLoaded = true;
          });
        }
        if (state is InventoryAvailableDataState) {
          setState(() {
            itemsList = state.itemsList2;
            isLoaded = false;
          });
        }
        if (state is InventoryErrorState) {
          snackBar(context, state.errorMessage, null);
          setState(() {
            isLoaded = false;
          });
        }
        if (state is InventoryItemFailedToDeletedState) {
          snackBar(context, state.errorMessage, null);
        }
        if (state is InventoryItemFailedToEditState) {
          snackBar(context, state.errorMessage, null);
        }
        if (state is InventoryItemEditedState) {
          setState(() {
            isLoaded = false;
          });
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
                  docID: itemsList[index].docIDForDeleteAndEdit,
                  passedModel: itemsList[index],
                  subCategory: widget.subCollection,
                );
              },
            ),
          );
        }
        if (state is InventoryEmptyState) {
          return BgEmptyScreensText(
            top: 0,
            text:
                "Category is empty now ........... when you add new item it will appear here.",
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
