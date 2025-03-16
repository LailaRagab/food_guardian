import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:food_guardian/features/inventory_feature/presentation/inventory_view/inventory_widgets/custom_add_manually_bottom_sheet.dart';

import 'package:go_router/go_router.dart';

import '../../../../../core/utils/assets/colors.dart';

class AddButton extends StatelessWidget {
  AddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      foregroundColor: AppColors.kWhite,
      backgroundColor: AppColors.kPrimary,
      children: [
        SpeedDialChild(
            shape: CircleBorder(),
            backgroundColor: AppColors.kPrimary,
            child: Icon(
              Icons.add,
              color: AppColors.kWhite,
            ),
            onTap: () {
              showModalBottomSheet(
                useSafeArea: true,
                isScrollControlled: true,
                backgroundColor: AppColors.kTransparent,
                context: context,
                builder: (context) {
                  return CustomAddManuallyBottomSheet();
                },
              );
            }),
        SpeedDialChild(
            shape: CircleBorder(),
            backgroundColor: AppColors.kPrimary,
            child: Icon(
              Icons.barcode_reader,
              color: AppColors.kWhite,
            ),
            onTap: () {
              GoRouter.of(context).push("/scan");
            })
      ],
    );
  }
}
