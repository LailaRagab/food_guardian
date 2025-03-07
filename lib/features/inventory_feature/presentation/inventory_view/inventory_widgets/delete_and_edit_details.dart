import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_guardian/features/inventory_feature/presentation/inventory_view/inventory_widgets/show_my_date_picker_widget.dart';

import '../../../../../core/utils/assets/colors.dart';
import '../../../../../core/utils/assets/fonts.dart';
import '../../../models/card_itme_model.dart';
import '../../inventory_view_model/inventory_category_cubit.dart';
import 'alert_dialog_text_button.dart';

class DeleteAndEditDetails extends StatelessWidget {
  DeleteAndEditDetails({
    super.key,
    required this.subCategory,
    required this.docID,
    required this.item,
  })  : nameController = TextEditingController(text: item.itemName),
        quantityController = TextEditingController(text: item.itemQuantity);

  final String subCategory;
  final String docID;
  final CardItemModel item;

  final TextEditingController nameController;
  final TextEditingController quantityController;
  late DateTime updatedExDate;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                deleteShowDialog(context);
              },
              child: Icon(
                Icons.delete,
                color: AppColors.kWhite,
                size: 30,
              ),
            ),
            Text(
              "Delete",
              style: AppFonts.font14,
            )
          ],
        ),
        SizedBox(width: 10),
        VerticalDivider(thickness: 1, color: AppColors.kWhite),
        SizedBox(width: 10),
        InkWell(
          onTap: () {
            editShowDialog(context);
          },
          child: Icon(
            size: 30,
            Icons.edit,
            color: AppColors.kWhite,
          ),
        ),
        Text(
          "Edit",
          style: AppFonts.font14,
        )
      ],
    );
  }

  void editShowDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Edit Item"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: "Name"),
              ),
              TextField(
                controller: quantityController,
                decoration: InputDecoration(labelText: "Quantity"),
              ),
              SizedBox(height: 20),
              ShowMyDatePickerWidget(onDateSelected: (DateTime value) {
                updatedExDate = value;
              })
            ],
          ),
          actions: [
            AlertDialogTextButton(
              onTap: () => Navigator.pop(context),
              text: "Cancel",
            ),
            AlertDialogTextButton(
              onTap: () {
                BlocProvider.of<InventoryCategoryCubit>(context).updateItem(
                    subCategory,
                    docID,
                    nameController.text,
                    quantityController.text,
                    updatedExDate);
                Navigator.pop(context);
              },
              text: "Save",
            ),
          ],
        );
      },
    );
  }

  void deleteShowDialog(BuildContext context) {
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
