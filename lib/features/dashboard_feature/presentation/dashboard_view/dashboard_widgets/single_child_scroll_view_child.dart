import 'package:flutter/material.dart';
import 'package:food_guardian/core/utils/assets/fonts.dart';
import 'package:food_guardian/core/widgets/custom_text.dart';
import 'package:food_guardian/features/dashboard_feature/presentation/dashboard_view/dashboard_widgets/dashboard_chart_container.dart';
import 'package:food_guardian/features/dashboard_feature/presentation/dashboard_view/dashboard_widgets/dashboard_number_of_items_row.dart';

class SingleChildScrollViewChild extends StatefulWidget {
  const SingleChildScrollViewChild({super.key});

  @override
  State<SingleChildScrollViewChild> createState() =>
      _SingleChildScrollViewChildState();
}

class _SingleChildScrollViewChildState
    extends State<SingleChildScrollViewChild> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 30),
        CustomText(text: "Storage Breakdown", style: AppFonts.fontBlack18),
        const SizedBox(height: 20),
        DashboardNumberOfItemsRow(),
        // DashboardItemsStatusCards(),
        const SizedBox(height: 60),
        CustomText(text: "Tracking items status", style: AppFonts.fontBlack18),
        const SizedBox(height: 20),
        DashboardChartContainer(),
        const SizedBox(height: 60),
      ],
    );
  }
}
