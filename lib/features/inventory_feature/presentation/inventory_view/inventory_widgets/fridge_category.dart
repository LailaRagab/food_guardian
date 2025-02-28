import 'package:flutter/material.dart';
import 'package:food_guardian/features/inventory_feature/presentation/inventory_view/inventory_widgets/item_card.dart';

class FridgeCategory extends StatelessWidget {
  const FridgeCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 35,
            ),
          ),
          SliverToBoxAdapter(
            child: ItemCard(
              itemID: '',
              onDelete: () {},
            ),
          ),
        ]);
  }
}
