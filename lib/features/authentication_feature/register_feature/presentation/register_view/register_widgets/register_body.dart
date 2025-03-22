import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_guardian/core/widgets/snack_bar.dart';
import 'package:food_guardian/features/authentication_feature/register_feature/presentation/register_view_model/register_cubit/register_cubit.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/widgets/common_button.dart';
import 'auth_custom_text_field.dart';

class RegisterBody extends StatelessWidget {
  RegisterBody({
    super.key,
  });
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
                  if (rePassword != password) {
                    snackBar(context, "Passwords do not match!", null);
                    return;
                  }
                  BlocProvider.of<RegisterCubit>(context).registerUser(
                      email: email, password: password, name: name);
                  // widget.setLoading(false);
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
}
