import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/assets/images.dart';
import '../../../../inventory_feature/presentation/inventory_view/inventory_widgets/custom_upload_photo_alert_dialog.dart';

class ProfilePhotoAccount extends StatefulWidget {
  const ProfilePhotoAccount({
    super.key,
  });

  @override
  State<ProfilePhotoAccount> createState() => _ProfilePhotoAccountState();
}

class _ProfilePhotoAccountState extends State<ProfilePhotoAccount> {
  String? image;
  User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(alignment: AlignmentDirectional(2, 1), children: [
        CircleAvatar(
            radius: 40,
            backgroundImage: image != null
                ? FileImage(File(image!))
                : (user?.photoURL != null
                    ? FileImage(File(user!.photoURL!))
                    : AssetImage(AppImages.defaultProfileImage))),
        IconButton(
          icon: Icon(Icons.camera_alt_outlined),
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return CustomUploadPhotoAlertDialog(
                    onImagePicked: (taked) {
                      setState(() {
                        image = taked;
                        user?.updatePhotoURL(image);
                        user?.reload();
                      });
                    },
                  );
                });
          },
        ),
      ]),
    );
  }
}
