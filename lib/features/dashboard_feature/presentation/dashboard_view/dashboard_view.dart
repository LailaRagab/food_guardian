import 'package:flutter/material.dart';
import 'package:food_guardian/features/dashboard_feature/presentation/dashboard_view/dashboard_widgets/dashboard_view_body.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: DashboardViewBody()),
    );
  }
}
