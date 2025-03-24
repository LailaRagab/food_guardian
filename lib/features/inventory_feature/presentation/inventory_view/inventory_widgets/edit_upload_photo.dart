import 'package:flutter/material.dart';
import 'custom_upload_image_button.dart';

class EditUploadPhoto extends StatefulWidget {
  String? forImage;
  EditUploadPhoto({
    super.key,
  });

  @override
  State<EditUploadPhoto> createState() => _EditUploadPhotoState();
}

class _EditUploadPhotoState extends State<EditUploadPhoto> {
  @override
  Widget build(BuildContext context) {
    return CustomUploadImageButton(
      onImagePicked: (taked) {
        setState(() {
          widget.forImage = taked;
        });
      },
    );
  }
}
