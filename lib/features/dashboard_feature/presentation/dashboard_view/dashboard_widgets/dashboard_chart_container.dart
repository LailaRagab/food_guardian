import 'package:flutter/material.dart';
import 'package:food_guardian/core/utils/assets/colors.dart';
import 'package:food_guardian/features/dashboard_feature/presentation/dashboard_view/dashboard_widgets/dashboard_bar_char.dart';

class DashboardChartContainer extends StatefulWidget {
  const DashboardChartContainer({super.key});

  @override
  State<DashboardChartContainer> createState() =>
      _DashboardChartContainerState();
}

class _DashboardChartContainerState extends State<DashboardChartContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        decoration: BoxDecoration(
          color: AppColors.kPrimary.withOpacity(0.3),
          borderRadius: BorderRadius.circular(12),
        ),
        child: DashboardBarChar());
  }
}
