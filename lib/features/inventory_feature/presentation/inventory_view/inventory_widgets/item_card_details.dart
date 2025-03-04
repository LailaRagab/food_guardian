import 'package:flutter/material.dart';
import 'package:food_guardian/core/utils/extensions/date_format_extension.dart';
import 'package:food_guardian/features/inventory_feature/models/card_itme_model.dart';

import '../../../../../core/utils/assets/colors.dart';
import '../../../../../core/utils/assets/fonts.dart';
import '../../../../../core/utils/assets/images.dart';

class ItemCardDetails extends StatelessWidget {
  const ItemCardDetails({super.key, required this.model});

  final CardItemModel model;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 15,
        ),
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
                style: AppFonts.font16
                    .copyWith(color: AppColors.kDarkGrey, fontSize: 12),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 70,
        ),
        Image(
          image: AssetImage(AppImages.logoIcon),
          width: 77,
          height: 70,
        ),
      ],
    );
  }
}
