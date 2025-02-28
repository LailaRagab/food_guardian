import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_guardian/core/utils/extensions/date_format_extension.dart';
import 'package:food_guardian/features/inventory_feature/models/card_itme_model.dart';
import 'package:food_guardian/features/inventory_feature/presentation/inventory_view/inventory_widgets/custom_adding_item_text_field.dart';
import 'package:food_guardian/features/inventory_feature/presentation/inventory_view/inventory_widgets/custom_drop_down_button.dart';
import 'package:food_guardian/features/inventory_feature/presentation/inventory_view/inventory_widgets/custom_small_button.dart';
import 'package:food_guardian/features/inventory_feature/presentation/inventory_view/inventory_widgets/custom_upload_image_button.dart';
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
  DateTime selectedDate = DateTime.now();

  String name = "";

  String quantity = "";

  String category = "Fridge";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
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
          InkWell(
            child: Text(
              selectedDate.dateFormate(),
              style: AppFonts.fontBlack18,
            ),
            onTap: () {
              showMyDatePicker(context);
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
          const SizedBox(height: 110),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomUploadImageButton(),
              const SizedBox(width: 30),
              CustomSmallButton(onTap: () {
                buildAddItemsToFirestore();
              }),
            ],
          ),
        ],
      ),
    );
  }

  void showMyDatePicker(BuildContext context) async {
    selectedDate = await showDatePicker(
            context: context,
            initialDate: selectedDate,
            firstDate: DateTime.now(),
            lastDate: DateTime.now().add(Duration(days: 365))) ??
        selectedDate;
    if (selectedDate != null) {
      setState(() {
        selectedDate = selectedDate;
      });
    }
  }

  void buildAddItemsToFirestore() {
    CollectionReference inventoryCollection = FirebaseFirestore.instance
        .collection(CardItemModel.collectionName)
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection(category);
    CardItemModel cardItemModel = CardItemModel(
      // id: FirebaseAuth.instance.currentUser!.uid,
      itemName: name,
      itemQuantity: quantity,
      itemExpirationDate: selectedDate,
      // itemCategory: category,
    );

    inventoryCollection.add(cardItemModel.toJson());
  }
}
