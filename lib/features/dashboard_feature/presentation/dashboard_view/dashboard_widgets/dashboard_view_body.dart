import 'package:flutter/material.dart';
import 'package:food_guardian/features/dashboard_feature/presentation/dashboard_view/dashboard_widgets/single_child_scroll_view_child.dart';

class DashboardViewBody extends StatefulWidget {
  const DashboardViewBody({super.key});

  @override
  State<DashboardViewBody> createState() => _DashboardViewBodyState();
}

class _DashboardViewBodyState extends State<DashboardViewBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: const EdgeInsets.all(16), child: SingleChildScrollViewChild());
  }
}
