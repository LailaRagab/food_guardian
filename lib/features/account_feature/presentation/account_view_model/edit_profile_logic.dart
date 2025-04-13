import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_guardian/core/utils/snack_bar.dart';
import 'package:food_guardian/core/widgets/custom_text_field.dart';
import 'package:food_guardian/features/account_feature/presentation/account_view/account_widgets/shared_alert_dialog.dart';
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
    return SharedAlertDialog(
      alertDialogTitle: "Edit Profile",
      columnChildren: [
        CustomTextField(label: "Name", controller: nameController),
        CustomTextField(label: "Email", controller: emailController)
      ],
      elevatedButtonText: "Update",
      onPressedElevatedButton: () async {
        if (nameController.text.isNotEmpty) {
          await user?.updateDisplayName(nameController.text);
          await user?.reload(); // Reload user data to reflect changes
          setState(() {}); // Notify parent widget to rebuild
        } else {
          snackBar(context, "There is nothing updated!", null);
        }
        if (emailController.text.isNotEmpty) {
          if (context.mounted) {
            await UpdateEmail.updateEmail(context, emailController);
          }
          await user?.reload();
          setState(() {}); // Notify parent widget to rebuild
        }
        if (context.mounted) {
          Navigator.of(context).pop();
        }
      },
    );
  }
}
