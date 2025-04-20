import 'package:flutter/material.dart';

import 'dashboard_number_of_items_in_inventory.dart';

class DashboardNumberOfItemsRow extends StatelessWidget {
  const DashboardNumberOfItemsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        DashboardNumberOfItemsInInventory(
            label: "Total Items",
            count: 7,
            icon: Icons.inventory,
            color: Colors.yellow),
        DashboardNumberOfItemsInInventory(
            label: "Fridge",
            count: 8,
            icon: Icons.kitchen,
            color: Colors.lightBlue),
        DashboardNumberOfItemsInInventory(
            label: "Freezer",
            count: 5,
            icon: Icons.ac_unit,
            color: Colors.indigo),
        DashboardNumberOfItemsInInventory(
            label: "Pantry", count: 3, icon: Icons.shelves, color: Colors.brown)
      ],
    );
  }
}
