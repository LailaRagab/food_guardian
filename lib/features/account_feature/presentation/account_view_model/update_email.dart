import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_guardian/core/utils/snack_bar.dart';

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

    String? password = await _getPasswordFromDialog(context);
    if (password == null || password.isEmpty) {
      snackBar(context, "Password is required to update email.", null);
      return;
    }

    // Re-authenticate
    AuthCredential credential = EmailAuthProvider.credential(
      email: user.email!,
      password: password,
    );

    try {
      await user.reauthenticateWithCredential(credential);

      // Send verification link to new email
      await user.verifyBeforeUpdateEmail(emailController.text);

      snackBar(
          context,
          "A verification link has been sent to ${emailController.text}. Please check your email.",
          null);

      // 🔹 Start listening for verification
      FirebaseAuth.instance
          .authStateChanges()
          .listen((User? updatedUser) async {
        if (updatedUser != null) {
          await updatedUser.reload(); // Refresh user info

          // 🔥 If email is verified, show success message
          if (updatedUser.emailVerified) {
            snackBar(context, "Email updated successfully!", null);
          }
        }
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        snackBar(
            context, "Please log in again before updating your email.", null);
      } else {
        snackBar(context, "Error: ${e.message}", null);
      }
    }
  }

  static Future<String?> _getPasswordFromDialog(BuildContext context) async {
    String? password;
    await showDialog(
      context: context,
      builder: (context) {
        final TextEditingController passwordController =
            TextEditingController();
        return AlertDialog(
          title: Text("Re-authenticate"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Enter your password to continue."),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(labelText: "Password"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                password = passwordController.text;
                Navigator.of(context).pop();
              },
              child: Text("Submit"),
            ),
          ],
        );
      },
    );

    return password;
  }
}
