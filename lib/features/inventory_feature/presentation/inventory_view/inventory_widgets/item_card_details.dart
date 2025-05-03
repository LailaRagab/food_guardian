import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food_guardian/core/utils/extensions/date_format_extension.dart';
import 'package:food_guardian/features/inventory_feature/presentation/inventory_view/inventory_widgets/row_of_name_and_quantity_.dart';
import '../../../../../core/utils/assets/colors.dart';
import '../../../../../core/utils/assets/fonts.dart';
import '../../../../../core/utils/assets/images.dart';
import '../../../inventory_models/card_itme_model.dart';

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
          child: Builder(
            builder: (_) {
              final img = model.itemImage;

              if (img == null || img.isEmpty) {
                return Image.asset(AppImages.logoIcon);
              }

              if (img.startsWith('http')) {
                return Image.network(img);
              }

              final file = File(img);
              if (file.existsSync()) {
                return Image.file(file);
              } else {
                return Image.asset(
                  AppImages.logoIcon,
                  errorBuilder: (_, __, ___) =>
                      const Icon(Icons.image_not_supported),
                );
              }
            },
          ),
        )
      ],
    );
  }
}
