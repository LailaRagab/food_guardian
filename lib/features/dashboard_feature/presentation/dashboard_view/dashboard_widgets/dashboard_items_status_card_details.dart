import 'package:flutter/material.dart';
import 'package:food_guardian/core/utils/assets/fonts.dart';
import 'package:food_guardian/core/widgets/custom_text.dart';

class DashboardItemsStatusCardDetails extends StatelessWidget {
  const DashboardItemsStatusCardDetails(
      {super.key,
      required this.title,
      required this.value,
      required this.icon,
      required this.color});
  final String title;
  final String value;
  final IconData icon;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: color.withOpacity(0.2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 36, color: color),
            const SizedBox(height: 8),
            CustomText(text: value, style: AppFonts.fontWhite20),
            CustomText(text: title, style: AppFonts.font14)
          ],
        ),
      ),
    );
  }
}
