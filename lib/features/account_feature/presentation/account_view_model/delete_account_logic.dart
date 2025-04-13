import 'package:flutter/material.dart';
import 'package:food_guardian/core/widgets/custom_text_field.dart';
import 'package:food_guardian/features/account_feature/presentation/account_view/account_widgets/shared_alert_dialog.dart';
import 'package:food_guardian/features/account_feature/presentation/account_view_model/delete_account_yes_button.dart';

class DeleteAccountLogic extends StatelessWidget {
  DeleteAccountLogic({super.key});

  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SharedAlertDialog(
      alertDialogTitle: "Are you sure that you want to delete the account?",
      columnChildren: [
        CustomTextField(
          label: "Password",
          controller: passwordController,
          obscureText: true,
        ),
      ],
      elevatedButtonText: "Yes",
      onPressedElevatedButton: () async {
        DeleteAccountYesButton.yesButton(passwordController, context);
      },
    );
  }
}
