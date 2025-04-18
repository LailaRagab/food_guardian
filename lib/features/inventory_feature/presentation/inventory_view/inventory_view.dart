import 'package:flutter/material.dart';
import 'package:food_guardian/core/utils/assets/colors.dart';
import 'package:food_guardian/core/utils/assets/fonts.dart';
import 'package:food_guardian/features/inventory_feature/presentation/inventory_view/inventory_widgets/add_buttons.dart';
import 'package:food_guardian/features/inventory_feature/presentation/inventory_view/inventory_widgets/freezer_category.dart';
import 'package:food_guardian/features/inventory_feature/presentation/inventory_view/inventory_widgets/fridge_category.dart';
import 'package:food_guardian/features/inventory_feature/presentation/inventory_view/inventory_widgets/pantry_category.dart';

import '../../../../core/utils/helpers/helper_for_fetch_fun.dart';
import '../../../notifications_feature/notifications_models/for_passing_switch_state.dart';
import '../../../notifications_feature/notifications_models/store_notifications_using_hive.dart';

class InventoryView extends StatefulWidget {
  const InventoryView({super.key});

  @override
  State<InventoryView> createState() => _InventoryViewState();
}

class _InventoryViewState extends State<InventoryView> {
  @override
  void initState() {
    NotificationModel.clearLocalNotifications();
    if (ForPassingSwitchState.instance.getSwitchValue) {
      scheduleAllNotifications();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
          child: Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(20),
                  child: TabBar(
                      unselectedLabelColor: AppColors.kBlack,
                      indicatorColor: AppColors.kPrimary,
                      labelStyle: AppFonts.fontWhite20
                          .copyWith(color: AppColors.kPrimary),
                      tabs: [
                        Tab(text: "Fridge", icon: Icon(Icons.kitchen)),
                        Tab(text: "Freezer", icon: Icon(Icons.ac_unit)),
                        Tab(text: "Pantry", icon: Icon(Icons.shelves)),
                      ]),
                ),
              ),
              body: TabBarView(children: [
                FridgeCategory(),
                FreezerCategory(),
                PantryCategory(),
              ]),
              floatingActionButton: AddButton())),
    );
  }
}
