import 'package:flutter/material.dart';
import 'package:food_guardian/features/inventory_feature/presentation/inventory_view/inventory_widgets/inventory_category_body.dart';

class PantryCategory extends StatelessWidget {
  const PantryCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return InventoryCategoryBody(subCollection: "Pantry");
  }
}
