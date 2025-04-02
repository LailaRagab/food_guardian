import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_guardian/core/widgets/custom_text_button.dart';
import 'package:food_guardian/core/widgets/custom_text_field.dart';
import 'package:food_guardian/core/widgets/elevated_button.dart';
import 'package:food_guardian/features/account_feature/presentation/account_view_model/update_email.dart';

class EditProfileLogic extends StatefulWidget {
  EditProfileLogic({super.key});

  @override
  State<EditProfileLogic> createState() => _EditProfileLogicState();
}

class _EditProfileLogicState extends State<EditProfileLogic> {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Edit Profile"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextField(label: "Name", controller: nameController),
          CustomTextField(label: "Email", controller: emailController),
        ],
      ),
      actions: [
        CustomElevatedButton(
          onPressed: () async {
            if (nameController.text.isNotEmpty) {
              await user?.updateDisplayName(nameController.text);
              await user?.reload(); // Reload user data to reflect changes
              setState(() {}); // Notify parent widget to rebuild
            }
            if (emailController.text.isNotEmpty) {
              await UpdateEmail.updateEmail(context, emailController);
              await user?.reload();
              setState(() {}); // Notify parent widget to rebuild
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
  }
}
