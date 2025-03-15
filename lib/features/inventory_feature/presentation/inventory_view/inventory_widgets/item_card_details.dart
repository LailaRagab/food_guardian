import 'package:flutter/material.dart';
import 'package:food_guardian/core/utils/extensions/date_format_extension.dart';
import 'package:food_guardian/features/inventory_feature/models/card_itme_model.dart';
import 'package:food_guardian/features/inventory_feature/presentation/inventory_view_model/on_pressed_gallery_and_camera_picker.dart';

import '../../../../../core/utils/assets/colors.dart';
import '../../../../../core/utils/assets/fonts.dart';
import '../../../../../core/utils/assets/images.dart';

class ItemCardDetails extends StatelessWidget {
  ItemCardDetails({super.key, required this.model});

  final CardItemModel model;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        VerticalDivider(
          indent: 25,
          endIndent: 25,
          thickness: 2,
          color: AppColors.kPrimary,
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Name: ${model.itemName}",
                style: AppFonts.font16,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "Quantity: ${model.itemQuantity}",
                style: AppFonts.font16,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "Expiration date: ${model.itemExpirationDate.dateFormate()}",
                style: AppFonts.font12,
              ),
            ],
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: model.itemImage ?? AssetImage(AppImages.logoIcon),
              )),
        )
      ],
    );
  }
}
