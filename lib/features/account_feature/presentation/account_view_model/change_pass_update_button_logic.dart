import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/snack_bar.dart';

class ChangePassUpdateButtonLogic {
  static updateFun(
      TextEditingController oldPassController,
      TextEditingController newPassController,
      TextEditingController confirmNewPassController,
      BuildContext context,
      User? user) async {
    if (oldPassController.text.isNotEmpty) {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: user!.email!, password: oldPassController.text);
        try {
          if (confirmNewPassController.text == newPassController.text) {
            await user?.updatePassword(newPassController.text);
            await user?.reload();
          } else {
            if (context.mounted) {
              snackBar(context, "Passwords do not match!", null);
            }
            ;
          }
        } on FirebaseAuthException catch (ex) {
          if (ex.code == 'weak-password') {
            if (context.mounted) {
              snackBar(context, 'The password provided is too weak.', null);
            }
          }
        }
      } catch (e) {
        if (context.mounted) {
          snackBar(context,
              "The old Password is not correct, please try again !", null);
        }
      }
    } else {
      snackBar(context, "There is nothing updated!", null);
    }
    if (context.mounted) {
      Navigator.pop(context);
    }
  }
}
