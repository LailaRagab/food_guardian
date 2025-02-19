import 'package:flutter/material.dart';
import 'package:food_guardian/features/authentication_feature/register_feature/presentation/register_view/register_widgets/auth_app_bar.dart';
import 'package:food_guardian/features/authentication_feature/sign_in_feature/presentation/sign_in_view/sign_in_widgets/sign_in_body.dart';
import 'package:go_router/go_router.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AuthAppBar(titleAppBar: 'Register', onTap: () {  GoRouter.of(context).push("/register"); },),
      body: SafeArea(child: SignInBody()),
    );
  }
}
