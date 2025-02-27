import 'package:flutter/material.dart';
import 'package:food_guardian/features/inventory_feature/presentation/inventory_view/inventory_widgets/item_card_details.dart';

import '../../../../../core/utils/assets/colors.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Container(
          width: 379,
          height: 123,
          decoration: BoxDecoration(
              color: AppColors.kItemCardBg,
              borderRadius: BorderRadius.all(Radius.circular(35))),
          child: ItemCardDetails()),
    );
  }
}
