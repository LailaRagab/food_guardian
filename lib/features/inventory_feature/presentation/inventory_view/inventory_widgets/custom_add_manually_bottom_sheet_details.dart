import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_guardian/features/inventory_feature/models/card_itme_model.dart';
import 'package:food_guardian/features/inventory_feature/presentation/inventory_view/inventory_widgets/custom_adding_item_text_field.dart';
import 'package:food_guardian/features/inventory_feature/presentation/inventory_view/inventory_widgets/custom_drop_down_button.dart';
import 'package:food_guardian/features/inventory_feature/presentation/inventory_view/inventory_widgets/custom_small_button.dart';
import 'package:food_guardian/features/inventory_feature/presentation/inventory_view/inventory_widgets/custom_upload_image_button.dart';
import 'package:food_guardian/features/inventory_feature/presentation/inventory_view/inventory_widgets/show_my_date_picker_widget.dart';

import '../../../../../core/utils/assets/fonts.dart';

class CustomAddManuallyBottomSheetDetails extends StatefulWidget {
  CustomAddManuallyBottomSheetDetails({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomAddManuallyBottomSheetDetails> createState() =>
      _CustomAddManuallyBottomSheetDetailsState();
}

class _CustomAddManuallyBottomSheetDetailsState
    extends State<CustomAddManuallyBottomSheetDetails> {
  DateTime? selectedExpirationDate;

  String name = "";

  String quantity = "";

  String category = "Fridge";

  GlobalKey<FormState> formKey = GlobalKey();

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
            ),
            CustomAddingItemTextField(
              hint: "Quantity",
              onSubmitted: (qInput) {
                setState(() {
                  quantity = qInput;
                });
              },
            ),
            const SizedBox(height: 20),
            CustomDropDownButton(
              selectedCategory: category,
              onChanged: (String? value) {
                setState(() {
                  category = value!;
                });
              },
            ),
            SizedBox(
              height: 115,
            ),
            ShowMyDatePickerWidget(
              onDateSelected: (DateTime value) {
                selectedExpirationDate = value;
              },
            ),
            const SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomUploadImageButton(),
                const SizedBox(width: 30),
                CustomSmallButton(onTap: () {
                  if (formKey.currentState!.validate()) {
                    buildAddItemsToFirestore();
                  }
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void buildAddItemsToFirestore() {
    CollectionReference inventoryCollection = FirebaseFirestore.instance
        .collection(CardItemModel.collectionName)
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection(category);

    DocumentReference documentReference = inventoryCollection.doc();
    CardItemModel cardItemModel = CardItemModel(
      docIDForDeleteAndEdit: documentReference.id,
      itemName: name,
      itemQuantity: quantity,
      itemExpirationDate: selectedExpirationDate!,
    );
    documentReference.set(cardItemModel.toJson());
    Navigator.pop(context);
    // inventoryCollection.add(cardItemModel.toJson());
  }
}
