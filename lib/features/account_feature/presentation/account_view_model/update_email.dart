import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_guardian/core/utils/assets/colors.dart';
import 'package:food_guardian/core/utils/snack_bar.dart';
import 'package:go_router/go_router.dart';

class UpdateEmail {
  static Future<void> updateEmail(
      BuildContext context, TextEditingController emailController) async {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      snackBar(context, "No user logged in!", null);
      return;
    }

    if (user.email == emailController.text) {
      snackBar(context, "New email is the same as the current email.", null);
      return;
    }
    try {
      // Send verification link to new email
      await user.verifyBeforeUpdateEmail(emailController.text);
      await user.reload();

      snackBar(
          context,
          "A verification link has been sent to ${emailController.text}. Please check your email.",
          null);

      snackBar(
          context,
          "Please log in again after verification to update your email",
          SnackBarAction(
              label: "Log In Again",
              textColor: AppColors.kPrimary,
              onPressed: () {
                GoRouter.of(context).push("/login");
              }));
    } on FirebaseAuthException catch (e) {
      snackBar(context, "Error: ${e.message}", null);
    }
  }
}
