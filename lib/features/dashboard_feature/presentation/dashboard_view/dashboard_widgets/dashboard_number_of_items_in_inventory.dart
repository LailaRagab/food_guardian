import 'package:flutter/material.dart';
import 'package:food_guardian/core/utils/assets/colors.dart';
import 'package:food_guardian/core/utils/assets/fonts.dart';

class DashboardNumberOfItemsInInventory extends StatelessWidget {
  const DashboardNumberOfItemsInInventory(
      {super.key,
      required this.label,
      required this.count,
      required this.icon,
      required this.color});
  final String label;
  final int count;
  final IconData icon;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: color),
        Text(label),
        Text(
          "$count items",
          style: AppFonts.font14.copyWith(color: AppColors.kBlack),
        ),
      ],
    );
  }
}
