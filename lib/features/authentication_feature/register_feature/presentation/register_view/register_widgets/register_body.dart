import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_guardian/features/authentication_feature/register_feature/presentation/register_view/register_widgets/auth_snack_bar.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/widgets/common_button.dart';
import 'auth_custom_text_field.dart';

class RegisterBody extends StatefulWidget {
  RegisterBody({
    super.key,
    required this.setLoading,
  });

  final Function(bool) setLoading;

  @override
  State<RegisterBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
  String? email;

  String? password;

  String? rePassword;

  String? name;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 60,
      ),
      child: Form(
        key: formKey,
        child: ListView(
          children: [
            SizedBox(
              height: 170,
            ),
            AuthCustomTextFormField(
              onChanged: (inputU) {
                name = inputU;
              },
              hintText: "Household nickname",
              preIcon: Icon(Icons.person),
            ),
            SizedBox(
              height: 30,
            ),
            AuthCustomTextFormField(
                onChanged: (inputE) {
                  email = inputE;
                },
                hintText: "E-mail",
                preIcon: Icon(Icons.email_outlined)),
            SizedBox(
              height: 30,
            ),
            AuthCustomTextFormField(
              onChanged: (inputP) {
                password = inputP;
              },
              hintText: "Password",
              forSecure: true,
              preIcon: Icon(Icons.lock_rounded),
            ),
            SizedBox(
              height: 30,
            ),
            AuthCustomTextFormField(
              onChanged: (inputRePass) {
                rePassword = inputRePass;
              },
              hintText: "Repeat password",
              forSecure: true,
              preIcon: Icon(Icons.lock_rounded),
            ),
            SizedBox(
              height: 90,
            ),
            CommonButton(
              onTap: () async {
                if (formKey.currentState!.validate()) {
                  widget.setLoading(true);
                  try {
                    await registerUser(context);
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      snackBar(context, 'The password provided is too weak.');
                    } else if (e.code == 'email-already-in-use') {
                      snackBar(context,
                          'The account already exists for that email.');
                    }
                  } catch (e) {
                    snackBar(context, "There is an error");
                  }
                  widget.setLoading(false);
                }
              },
            ),
            SizedBox(
              height: 170,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> registerUser(BuildContext context) async {
    if (rePassword != password) {
      snackBar(context, "Passwords do not match!");
      widget.setLoading(false);
      return;
    }
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
    await credential.user?.updateDisplayName(name);
    await credential.user?.reload();
    widget.setLoading(false);
    GoRouter.of(context).push("/home");
  }
}
