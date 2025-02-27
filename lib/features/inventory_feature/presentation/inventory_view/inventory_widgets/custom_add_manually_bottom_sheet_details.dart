import 'package:flutter/material.dart';
import 'package:food_guardian/features/inventory_feature/presentation/inventory_view/inventory_widgets/custom_adding_item_text_field.dart';
import 'package:food_guardian/features/inventory_feature/presentation/inventory_view/inventory_widgets/custom_drop_down_button.dart';
import 'package:food_guardian/features/inventory_feature/presentation/inventory_view/inventory_widgets/custom_small_button.dart';
import 'package:food_guardian/features/inventory_feature/presentation/inventory_view/inventory_widgets/custom_upload_image_button.dart';
import '../../../../../core/utils/assets/fonts.dart';

class CustomAddManuallyBottomSheetDetails extends StatelessWidget {
  const CustomAddManuallyBottomSheetDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
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
            hint: "Name",
          ),
          CustomAddingItemTextField(hint: "Quantity"),
          CustomAddingItemTextField(hint: "Expiration Date"),
          SizedBox(
            height: 20,
          ),
          CustomDropDownButton(),
          SizedBox(
            height: 110,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomUploadImageButton(),
              SizedBox(
                width: 30,
              ),
              CustomSmallButton(),
            ],
          ),
        ],
      ),
    );
  }
}
