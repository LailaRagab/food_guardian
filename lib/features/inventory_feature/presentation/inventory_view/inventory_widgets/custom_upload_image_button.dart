import 'package:flutter/material.dart';
import 'package:food_guardian/core/utils/assets/colors.dart';
import 'package:food_guardian/core/utils/assets/fonts.dart';
import 'package:food_guardian/features/inventory_feature/presentation/inventory_view/inventory_widgets/custom_upload_photo_alert_dialog.dart';

class CustomUploadImageButton extends StatelessWidget {
  const CustomUploadImageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.kTransparent,
      child: InkWell(
        onTap: () {
          showDialog(
              context: context,
              builder: (context) {
                return CustomUploadPhotoAlertDialog();
              });
        },
        child: Container(
          width: 120,
          height: 40,
          decoration: BoxDecoration(
              color: AppColors.kUploadButtonBg,
              borderRadius: BorderRadius.all(Radius.circular(35))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.arrow_upward,
                color: AppColors.kUploadButtonText,
              ),
              Text("Upload Image", style: AppFonts.font13)
            ],
          ),
        ),
      ),
    );
  }
}
