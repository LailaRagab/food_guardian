import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_guardian/core/utils/snack_bar.dart';
import 'package:food_guardian/core/widgets/custom_text_field.dart';
import 'package:food_guardian/features/account_feature/presentation/account_view/account_widgets/shared_alert_dialog.dart';

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
        if (passwordController.text.isNotEmpty) {
          try {
            // Get email of current user
            User? oldUser = FirebaseAuth.instance.currentUser;

            // Re-authenticate
            await FirebaseAuth.instance.signInWithEmailAndPassword(
              email: oldUser!.email!,
              password: passwordController.text,
            );

            // Get the new current user after re-authentication
            User? currentUser = FirebaseAuth.instance.currentUser;

            // Delete the account
            if (context.mounted) {
              Navigator.of(context).pop();
            }
            await currentUser?.delete();
            SystemNavigator.pop();
          } on FirebaseAuthException catch (e) {
            if (context.mounted) {
              if (e.code == "wrong-password") {
                snackBar(context, "Password is not correct, please try again!",
                    null);
              } else {
                snackBar(context, "Error: ${e.message}", null);
              }
            }
          }
        } else {
          snackBar(context, "Please enter your password to confirm", null);
        }
      },
    );
  }
}
