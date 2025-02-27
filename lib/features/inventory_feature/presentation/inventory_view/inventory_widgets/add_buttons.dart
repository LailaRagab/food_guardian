import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:food_guardian/features/inventory_feature/presentation/inventory_view/inventory_widgets/custom_add_manually_bottom_sheet.dart';

import '../../../../../core/utils/assets/colors.dart';

class AddButton extends StatelessWidget {
  const AddButton({super.key});

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
              Icons.qr_code_scanner,
              color: AppColors.kWhite,
            ),
            onTap: () {})
      ],
    );
  }
}
