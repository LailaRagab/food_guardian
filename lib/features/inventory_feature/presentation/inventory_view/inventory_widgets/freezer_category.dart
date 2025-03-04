import 'package:flutter/material.dart';
import 'package:food_guardian/features/inventory_feature/presentation/inventory_view/inventory_widgets/inventory_category_body.dart';

class FreezerCategory extends StatelessWidget {
  const FreezerCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return InventoryCategoryBody(subCollection: "Freezer");
  }
}
