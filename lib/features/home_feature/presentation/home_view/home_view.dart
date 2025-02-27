import 'package:flutter/material.dart';
import 'package:food_guardian/core/utils/assets/colors.dart';
import 'package:food_guardian/core/utils/assets/images.dart';
import 'package:food_guardian/core/widgets/custom_app_bar.dart';
import 'package:food_guardian/core/widgets/custom_bottom_navigation_bar.dart';
import 'package:food_guardian/features/account_feature/presentation/account_view/account_view.dart';
import 'package:food_guardian/features/dashboard_feature/presentation/dashboard_view/dashboard_view.dart';
import 'package:food_guardian/features/home_feature/presentation/home_widgets/home_empty_body.dart';
import 'package:food_guardian/features/inventory_feature/presentation/inventory_view/inventory_view.dart';
import 'package:food_guardian/features/recieps_feature/presentation/recieps_view/recieps_view.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;

  List<Widget> tabs = [
    HomeEmptyBody(),
    InventoryView(),
    ReciepsView(),
    DashboardView(),
    AccountView()
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: CustomAppBar(),
            body: tabs[currentIndex],
            bottomNavigationBar: CustomBottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (int value) {
                setState(() {
                  currentIndex = value;
                });
              },
            )));
  }
}
