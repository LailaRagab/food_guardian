import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../inventory_view/inventory_widgets/alert_dialog_text_button.dart';
import '../../models/inventory_category_cubit.dart';

class DeleteLogic {
  void deleteShowDialog(
      BuildContext context, String subCategory, String docID) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Confirm Delete"),
          content: Text("Are you sure you want to delete this item?"),
          actions: [
            AlertDialogTextButton(
              text: "Cancel",
              onTap: () => Navigator.of(context).pop(),
            ),
            AlertDialogTextButton(
              text: "Confirm",
              onTap: () {
                Navigator.of(context).pop();
                BlocProvider.of<InventoryCategoryCubit>(context)
                    .deleteItem(subCategory, docID);
              },
            ),
          ],
        );
      },
    );
  }
}
