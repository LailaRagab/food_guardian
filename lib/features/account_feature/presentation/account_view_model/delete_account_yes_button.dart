import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/utils/snack_bar.dart';

class DeleteAccountYesButton {
  static yesButton(
      TextEditingController passwordController, BuildContext context) async {
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
            snackBar(
                context, "Password is not correct, please try again!", null);
          } else {
            snackBar(context, "Error: ${e.message}", null);
          }
        }
      }
    } else {
      snackBar(context, "Please enter your password to confirm", null);
    }
  }
}
