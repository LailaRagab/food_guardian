import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food_guardian/core/utils/extensions/date_format_extension.dart';
import 'package:food_guardian/features/inventory_feature/models/card_itme_model.dart';
import 'package:food_guardian/features/inventory_feature/presentation/inventory_view/inventory_widgets/row_of_name_and_quantity_.dart';
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
              RowOfNameAndQuantity(
                textLabel: "Name: ",
                input: "${model.itemName}",
                numLines: 3,
                textLabelSize: 50,
              ),
              SizedBox(
                height: 8,
              ),
              RowOfNameAndQuantity(
                  textLabel: "Quantity: ",
                  input: "${model.itemQuantity}",
                  numLines: 1,
                  textLabelSize: 80),
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
          ),
          child: model.itemImage != null
              ? model.itemImage!.startsWith('http')
                  ? Image.network(model
                      .itemImage!) // If it starts with 'http', treat it as a URL
                  : Image.file(File(
                      model.itemImage!)) // Otherwise, treat it as a file path
              : Image.asset(AppImages.logoIcon),
        )
      ],
    );
  }
}
