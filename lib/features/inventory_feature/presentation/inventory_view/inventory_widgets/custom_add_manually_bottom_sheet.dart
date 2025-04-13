import 'package:flutter/material.dart';
import 'package:food_guardian/features/inventory_feature/presentation/inventory_view/inventory_widgets/custom_add_manually_bottom_sheet_details.dart';

import '../../../../../core/utils/assets/colors.dart';

class CustomAddManuallyBottomSheet extends StatelessWidget {
  const CustomAddManuallyBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 600,
        decoration: BoxDecoration(
            color: AppColors.kWhite,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(35), topLeft: Radius.circular(35)),
            boxShadow: [
              BoxShadow(
                blurRadius: 4,
                color: AppColors.kPrimary,
              ),
            ]),
        child: CustomAddManuallyBottomSheetDetails());
    ;
  }
}
