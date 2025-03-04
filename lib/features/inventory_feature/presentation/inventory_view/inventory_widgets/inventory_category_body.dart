import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_guardian/core/utils/assets/fonts.dart';
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
      listener: (context, Object? state) {
        if (state is LoadingState) {
          isLoaded = true;
        }
        if (state is AvailableDataState) {
          itemsList = state.itemsList2;
          isLoaded = false;
        }
        if (state is ErrorState) {
          snackBar(context, state.errorMessage);
          isLoaded = false;
        }
      },
      builder: (context, state) {
        if (state is AvailableDataState) {
          return ModalProgressHUD(
            inAsyncCall: isLoaded,
            child: ListView.builder(
                itemCount: itemsList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ItemCard(
                    itemID: '',
                    onDelete: () {},
                    passedModel: itemsList[index],
                  );
                }),
          );
        }
        if (state is EmptyState) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Center(
              child: Text(
                  "Category is empty now ........... when you add new item it will appear here. ",
                  style: AppFonts.fontGrey20),
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
