import 'package:flutter/material.dart';

import '../utils/assets/colors.dart';
import '../utils/assets/images.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
          onTap: onTap,
          currentIndex: currentIndex,
          selectedItemColor: AppColors.kPrimary,
          items: [
            // BottomNavigationBarItem(
            //     icon: Icon(Icons.home_filled), label: "Home"),
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
    );
  }
}
