import 'package:flutter/material.dart';
import 'package:food_guardian/features/inventory_feature/presentation/inventory_view/inventory_widgets/custom_adding_item_text_field.dart';
import 'package:food_guardian/features/inventory_feature/presentation/inventory_view/inventory_widgets/custom_drop_down_button.dart';
import 'package:food_guardian/features/inventory_feature/presentation/inventory_view/inventory_widgets/custom_small_button.dart';
import 'package:food_guardian/features/inventory_feature/presentation/inventory_view/inventory_widgets/custom_upload_image_button.dart';
import 'package:food_guardian/features/inventory_feature/presentation/inventory_view/inventory_widgets/custom_show_my_date_picker_widget.dart';
import 'package:food_guardian/features/inventory_feature/presentation/inventory_view_model/write_on_firestore_logic.dart';

import '../../../../../core/utils/assets/fonts.dart';

class CustomAddManuallyBottomSheetDetails extends StatefulWidget {
  const CustomAddManuallyBottomSheetDetails({
    super.key,
  });

  @override
  State<CustomAddManuallyBottomSheetDetails> createState() =>
      _CustomAddManuallyBottomSheetDetailsState();
}

class _CustomAddManuallyBottomSheetDetailsState
    extends State<CustomAddManuallyBottomSheetDetails> {
  DateTime? selectedExpirationDate;

  String? name;

  String? quantity;

  late String category;

  GlobalKey<FormState> formKey = GlobalKey();

  String? image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Add new item",
                  style: AppFonts.fontBlack18,
                )
              ],
            ),
            CustomAddingItemTextField(
              hint: 'Name',
              onSubmitted: (nInput) {
                setState(() {
                  name = nInput;
                });
              },
              getName: name,
            ),
            CustomAddingItemTextField(
              hint: "Quantity",
              onSubmitted: (qInput) {
                setState(() {
                  quantity = qInput;
                });
              },
            ),
            CustomShowMyDatePickerWidget(
              onDateSelected: (DateTime value) {
                selectedExpirationDate = value;
              },
            ),
            CustomDropDownButton(
              onChanged: (String? value) {
                setState(() {
                  category = value!;
                });
              },
            ),
            const SizedBox(height: 130),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomUploadImageButton(
                  onImagePicked: (taked) {
                    setState(() {
                      image = taked;
                    });
                  },
                ),
                const SizedBox(width: 30),
                CustomSmallButton(onTap: () {
                  if (formKey.currentState!.validate()) {
                    WriteOnFireStoreLogic.buildAddItemsToFirestore(
                      context,
                      category,
                      name!,
                      quantity,
                      selectedExpirationDate!,
                      image,
                      null,
                    );
                  }
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
