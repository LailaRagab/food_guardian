import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../../../core/utils/assets/images.dart';
import '../../../../../inventory_feature/presentation/inventory_view/inventory_widgets/custom_upload_photo_alert_dialog.dart';

class ProfilePhotoRegister extends StatefulWidget {
  ProfilePhotoRegister(
      {super.key, required this.onImagePicked, required this.image});
  Function(String?) onImagePicked;
  final String? image;
  @override
  State<ProfilePhotoRegister> createState() => _ProfilePhotoRegisterState();
}

class _ProfilePhotoRegisterState extends State<ProfilePhotoRegister> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(alignment: AlignmentDirectional(2, 1), children: [
        CircleAvatar(
            radius: 40,
            backgroundImage: widget.image != null
                ? FileImage(File(widget.image!))
                : AssetImage(AppImages.defaultProfileImage)),
        IconButton(
          icon: Icon(Icons.camera_alt_outlined),
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return CustomUploadPhotoAlertDialog(
                      onImagePicked: widget.onImagePicked);
                });
          },
        ),
      ]),
    );
  }
}
