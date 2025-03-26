import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_guardian/core/utils/snack_bar.dart';
import 'package:food_guardian/features/account_feature/presentation/account_view/account_widgets/profile_photo_account.dart';
import 'package:food_guardian/features/authentication_feature/register_feature/presentation/register_view/register_widgets/profile_photo_register.dart';
import 'package:food_guardian/features/authentication_feature/register_feature/presentation/register_view_model/register_cubit/register_cubit.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/widgets/common_button.dart';
import 'auth_custom_text_field.dart';

class RegisterBody extends StatefulWidget {
  RegisterBody({
    super.key,
  });

  @override
  State<RegisterBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
  String? email;

  String? password;

  String? rePassword;

  String? name;

  GlobalKey<FormState> formKey = GlobalKey();
  String? image;

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
              height: 70,
            ),
            ProfilePhotoRegister(
              onImagePicked: (taked) {
                setState(() {
                  image = taked;
                });
              },
              image: image,
            ),
            SizedBox(
              height: 50,
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
                      email: email,
                      password: password,
                      name: name,
                      image: image);
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
