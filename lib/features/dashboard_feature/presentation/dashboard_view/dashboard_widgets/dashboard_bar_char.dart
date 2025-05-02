import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:food_guardian/features/dashboard_feature/dashboard_models/for_passing_item_state_to_dashboard.dart';
import 'package:food_guardian/features/dashboard_feature/presentation/dashboard_view/dashboard_widgets/dashboard_bar_chart_bottom_title.dart';

class DashboardBarChar extends StatefulWidget {
  DashboardBarChar({super.key});
  final passingStatus =
      ForPassingItemStateToDashboard.forPassingItemStateToDashboard;
  @override
  State<DashboardBarChar> createState() => _DashboardBarCharState();
}

class _DashboardBarCharState extends State<DashboardBarChar> {
  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        barGroups: [
          BarChartGroupData(
            x: 0,
            barRods: [
              BarChartRodData(
                toY: widget.passingStatus.getFreshCount ?? 0, // Fresh
                color: Colors.blue,
                width: 25,
                borderRadius: BorderRadius.circular(4),
              ),
              BarChartRodData(
                toY: widget.passingStatus.getUsedCount ?? 0, // Used
                color: Colors.green,
                width: 25,
                borderRadius: BorderRadius.circular(4),
              ),
              BarChartRodData(
                toY: widget.passingStatus.getExpiredCount ?? 0, // Expired
                color: Colors.red,
                width: 25,
                borderRadius: BorderRadius.circular(4),
              ),
              BarChartRodData(
                toY: widget.passingStatus.getExpireSoonCount ??
                    0, // Expiring Soon
                color: Colors.orange,
                width: 25,
                borderRadius: BorderRadius.circular(4),
              ),
            ],
            barsSpace: 60,
          ),
        ],
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, _) {
                return DashboardBarChartBottomTitle();
              },
            ),
          ),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        borderData: FlBorderData(show: false),
      ),
    );
  }
}
