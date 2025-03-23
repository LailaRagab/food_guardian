import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/assets/colors.dart';
import '../../../../core/utils/snack_bar.dart';
import '../../../inventory_feature/presentation/inventory_view/inventory_widgets/custom_add_manually_bottom_sheet.dart';

class ShowSnackBarHandlingBarcodeReader {
  static void customSnackBarAction(BuildContext context) {
    snackBar(
        context,
        'Product not found. Would you like to add with yourself?',
        SnackBarAction(
            textColor: AppColors.kPrimary,
            label: "Add",
            onPressed: () {
              showModalBottomSheet(
                useSafeArea: true,
                isScrollControlled: true,
                backgroundColor: AppColors.kTransparent,
                context: context,
                builder: (context) {
                  return CustomAddManuallyBottomSheet();
                },
              );
            }));
  }

  static void snackBarCompleteData(BuildContext context) {
    snackBar(
        context,
        "Incomplete product data. Edit product to complete it with yourself.",
        null);
  }

  static void snackBarForOtherErrorsTypes(BuildContext context) {
    snackBar(context, "An unexpected error occurred. Try again.", null);
  }
}
