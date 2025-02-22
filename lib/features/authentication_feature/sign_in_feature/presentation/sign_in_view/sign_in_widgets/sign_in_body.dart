import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_guardian/features/authentication_feature/sign_in_feature/presentation/sign_in_view_model/sign_in_cubit/sign_in_cubit.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/widgets/common_button.dart';
import '../../../../register_feature/presentation/register_view/register_widgets/auth_custom_text_field.dart';

class SignInBody extends StatelessWidget {
  SignInBody({
    super.key,
  });

  String? email;

  String? password;

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
              height: 230,
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
              height: 90,
            ),
            CommonButton(
              textCommonButton: "Sign in",
              onTap: () async {
                if (formKey.currentState!.validate()) {
                  BlocProvider.of<SignInCubit>(context)
                      .signInAuth(email: email, password: password);
                }
              },
            ),
            SizedBox(
              height: 230,
            ),
          ],
        ),
      ),
    );
  }
}
