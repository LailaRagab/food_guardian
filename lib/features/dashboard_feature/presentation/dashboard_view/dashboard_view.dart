import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_guardian/features/dashboard_feature/presentation/dashboard_view/dashboard_widgets/dashboard_view_body.dart';
import 'package:food_guardian/features/inventory_feature/inventory_models/inventory_category_cubit.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  // @override
  // void initState() {
  //   super.initState();
  //   BlocProvider.of<InventoryCategoryCubit>(context)
  //       .countAllUsedItemsAcrossCategories();
  //
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: DashboardViewBody()),
    );
  }
}
