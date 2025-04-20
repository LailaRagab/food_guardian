import 'package:flutter/material.dart';
import 'package:food_guardian/core/utils/assets/colors.dart';

import 'dashboard_items_status_card_details.dart';

class DashboardItemsStatusCards extends StatelessWidget {
  const DashboardItemsStatusCards({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        DashboardItemsStatusCardDetails(
            title: "Fresh Food",
            value: "6",
            icon: Icons.eco,
            color: AppColors.kTeal),
        DashboardItemsStatusCardDetails(
            title: "Used",
            value: "10",
            icon: Icons.check_circle,
            color: AppColors.kPrimary),
        DashboardItemsStatusCardDetails(
            title: "Expired",
            value: "4",
            icon: Icons.delete,
            color: AppColors.kRed),
        DashboardItemsStatusCardDetails(
            title: "Expiring Soon",
            value: "3",
            icon: Icons.warning,
            color: AppColors.kOrange),
      ],
    );
  }
}
