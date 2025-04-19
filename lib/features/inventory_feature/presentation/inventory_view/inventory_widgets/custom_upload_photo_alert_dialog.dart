import 'package:flutter/material.dart';
import 'package:food_guardian/features/inventory_feature/presentation/inventory_view/inventory_widgets/custom_upload_photo_options_text.dart';
import 'package:food_guardian/features/inventory_feature/presentation/inventory_view_model/on_pressed_gallery_and_camera_picker.dart';

import '../../../../../core/utils/assets/colors.dart';
import '../../../../../core/utils/assets/fonts.dart';
import 'custom_alert_dialog_text_button_photo.dart';

class CustomUploadPhotoAlertDialog extends StatefulWidget {
  CustomUploadPhotoAlertDialog({
    super.key,
    required this.onImagePicked,
  });

  Function(String?) onImagePicked;
  @override
  State<CustomUploadPhotoAlertDialog> createState() =>
      _CustomUploadPhotoAlertDialogState();
}

class _CustomUploadPhotoAlertDialogState
    extends State<CustomUploadPhotoAlertDialog> {
  OnPressedGalleryAndCameraPicker picker = OnPressedGalleryAndCameraPicker();
  String? takedImage;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "Select or take a new picture!",
        style: AppFonts.fontBlack18,
      ),
      actions: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomAlertDialogTextButtonPhoto(
              icon: Icon(
                Icons.photo,
                color: AppColors.kBlack,
                size: 40,
              ),
              onPressed: () async {
                await picker.onPressedGalleryPicker();
                setState(() {
                  takedImage = picker.image;
                });
                widget.onImagePicked(takedImage);
                Navigator.pop(context);
              },
            ),
            CustomUploadPhotoAptionsText(text: "Gallery"),
            SizedBox(
              height: 40,
            ),
            CustomAlertDialogTextButtonPhoto(
              icon: Icon(
                Icons.camera_alt_outlined,
                color: AppColors.kBlack,
                size: 40,
              ),
              onPressed: () async {
                await picker.onPressedCameraPicker();
                setState(() {
                  takedImage = picker.image;
                });
                widget.onImagePicked(takedImage);
                Navigator.pop(context);
              },
            ),
            CustomUploadPhotoAptionsText(text: "Camera"),
          ],
        )
      ],
    );
  }
}
