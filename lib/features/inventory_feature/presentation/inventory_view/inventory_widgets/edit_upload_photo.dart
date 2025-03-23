import 'package:flutter/material.dart';
import 'custom_upload_image_button.dart';

class EditUploadPhoto extends StatefulWidget {
  EditUploadPhoto({
    super.key,
  });

  String? image;
  @override
  State<EditUploadPhoto> createState() => _EditUploadPhotoState();
}

class _EditUploadPhotoState extends State<EditUploadPhoto> {
  String? image;

  @override
  Widget build(BuildContext context) {
    return CustomUploadImageButton(
      onImagePicked: (taked) {
        if (taked!.isNotEmpty) {
          setState(() {
            image = taked;
          });
        }
      },
    );
  }
}
