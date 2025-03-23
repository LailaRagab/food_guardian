import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_guardian/core/utils/assets/images.dart';
import 'package:food_guardian/features/inventory_feature/presentation/inventory_view/inventory_widgets/edit_upload_photo.dart';
import '../../models/card_itme_model.dart';
import '../inventory_view/inventory_widgets/alert_dialog_text_button.dart';
import '../inventory_view/inventory_widgets/custom_show_my_date_picker_widget.dart';
import '../inventory_view/inventory_widgets/text_field_edit_dialog.dart';
import 'inventory_category_cubit.dart';

class EditLogic {
  EditLogic({required this.item})
      : nameController = TextEditingController(text: item.itemName),
        quantityController = TextEditingController(text: item.itemQuantity);

  late CardItemModel item;
  late TextEditingController nameController;
  late TextEditingController quantityController;

  late DateTime updatedExDate;
  // String? image = ?? "";
  get nameControllerGet => nameController;
  get quantityControllerGet => quantityController;

  GlobalKey<FormState> formKey = GlobalKey();
  void editShowDialog(
    BuildContext context,
    String subCategory,
    String docID,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return Form(
          key: formKey,
          child: AlertDialog(
            title: Text("Edit Item"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFieldEditDialog(
                  controller: nameController,
                  label: "Name",
                  getName: nameController,
                ),
                TextFieldEditDialog(
                    controller: quantityController, label: "Quantity"),
                SizedBox(height: 20),
                CustomShowMyDatePickerWidget(
                  onDateSelected: (DateTime value) {
                    updatedExDate = value;
                  },
                ),
                SizedBox(height: 20),
                EditUploadPhoto()
              ],
            ),
            actions: [
              AlertDialogTextButton(
                onTap: () => Navigator.pop(context),
                text: "Cancel",
              ),
              AlertDialogTextButton(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    BlocProvider.of<InventoryCategoryCubit>(context).updateItem(
                      subCategory,
                      docID,
                      nameController.text,
                      quantityController.text,
                      updatedExDate,
                      // " image!"
                    );
                    Navigator.pop(context);
                  }
                },
                text: "Save",
              ),
            ],
          ),
        );
      },
    );
  }
}
