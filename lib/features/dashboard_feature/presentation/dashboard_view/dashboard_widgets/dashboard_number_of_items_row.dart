import 'package:flutter/material.dart';
import 'package:food_guardian/features/dashboard_feature/dashboard_models/for_passing_item_state_to_dashboard.dart';

import 'dashboard_number_of_items_in_inventory.dart';

class DashboardNumberOfItemsRow extends StatelessWidget {
  DashboardNumberOfItemsRow({super.key});
  final passingStatus =
      ForPassingItemStateToDashboard.forPassingItemStateToDashboard;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        DashboardNumberOfItemsInInventory(
            label: "Total Items",
            count: passingStatus.totalItems ?? 0,
            icon: Icons.inventory,
            color: Colors.yellow),
        DashboardNumberOfItemsInInventory(
            label: "Fridge",
            count: passingStatus.getFridgeCount ?? 0,
            icon: Icons.kitchen,
            color: Colors.lightBlue),
        DashboardNumberOfItemsInInventory(
            label: "Freezer",
            count: passingStatus.getFreezerCount ?? 0,
            icon: Icons.ac_unit,
            color: Colors.indigo),
        DashboardNumberOfItemsInInventory(
            label: "Pantry",
            count: passingStatus.getPantryCount ?? 0,
            icon: Icons.shelves,
            color: Colors.brown)
      ],
    );
  }
}
