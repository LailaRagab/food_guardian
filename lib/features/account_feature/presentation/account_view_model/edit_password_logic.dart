import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_guardian/core/utils/snack_bar.dart';
import 'package:food_guardian/features/account_feature/presentation/account_view/account_widgets/shared_alert_dialog.dart';
import 'package:food_guardian/features/account_feature/presentation/account_view_model/change_pass_update_button_logic.dart';

import '../../../../core/widgets/custom_text_field.dart';

class EditPasswordLogic extends StatelessWidget {
  EditPasswordLogic({super.key});
  User? user = FirebaseAuth.instance.currentUser;
  TextEditingController oldPassController = TextEditingController();
  TextEditingController newPassController = TextEditingController();
  TextEditingController confirmNewPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SharedAlertDialog(
        alertDialogTitle: "Change Password",
        columnChildren: [
          CustomTextField(
            obscureText: true,
            label: "Old Password ",
            controller: oldPassController,
          ),
          CustomTextField(
            label: "New Password",
            controller: newPassController,
            obscureText: true,
          ),
          CustomTextField(
            label: "Confirm New Password",
            controller: confirmNewPassController,
            obscureText: true,
          ),
        ],
        elevatedButtonText: "Update",
        onPressedElevatedButton: () {
          ChangePassUpdateButtonLogic.updateFun(oldPassController,
              newPassController, confirmNewPassController, context, user!);
        });
  }
}
