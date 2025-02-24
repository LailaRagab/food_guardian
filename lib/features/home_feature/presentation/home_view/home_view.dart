import 'package:flutter/material.dart';
import 'package:food_guardian/core/utils/assets/colors.dart';
import 'package:food_guardian/core/utils/assets/images.dart';
import 'package:food_guardian/core/widgets/app_bar.dart';
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
      appBar: TheAppBar(),
      body: tabs[currentIndex],
      bottomNavigationBar: SafeArea(
        child: Container(
          height: 70,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: AppColors.kWhite,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight: Radius.circular(35),
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.kPrimary,
                blurRadius: 4,
              )
            ],
          ),
          child: BottomNavigationBar(
            backgroundColor: AppColors.kTransparent,
            unselectedItemColor: AppColors.kBlack,
            elevation: 0,
            selectedItemColor: AppColors.kPrimary,
            currentIndex: currentIndex,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_filled), label: "Home"),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(AppImages.inventoryIcon)),
                  label: "Inventory"),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(AppImages.reciepsIcon)),
                  label: "Recieps"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.dashboard_customize_outlined),
                  label: "Dashboard"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.manage_accounts_outlined), label: "Account")
            ],
          ),
        ),
      ),
    ));
  }
}
