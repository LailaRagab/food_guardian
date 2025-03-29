import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_guardian/core/widgets/custom_text_button.dart';
import 'package:food_guardian/core/widgets/custom_text_field.dart';
import 'package:food_guardian/core/widgets/elevated_button.dart';
import 'package:food_guardian/features/account_feature/presentation/account_view_model/update_email.dart';

class EditProfileLogic {
  static Future<dynamic> buildEditProfileShowDialog(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    User? user = FirebaseAuth.instance.currentUser;
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Edit Profile"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomTextField(label: "Name", controller: nameController),
                CustomTextField(label: "Update", controller: emailController),
              ],
            ),
            actions: [
              CustomElevatedButton(
                onPressed: () async {
                  if (nameController.text.isNotEmpty) {
                    user?.updateDisplayName(nameController.text);
                  }
                  if (emailController.text.isNotEmpty) {
                    await UpdateEmail.updateEmail(context, emailController);
                  }
                  Navigator.of(context).pop();
                },
                text: 'Update',
              ),
              CustomTextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  text: "Cancel"),
            ],
          );
        });
  }
}
