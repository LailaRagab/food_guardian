import 'package:flutter/material.dart';
import 'package:food_guardian/features/authentication_feature/register_feature/presentation/register_view/register_widgets/auth_app_bar.dart';
import 'package:food_guardian/features/authentication_feature/register_feature/presentation/register_view/register_widgets/register_body.dart';
import 'package:go_router/go_router.dart';


class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AuthAppBar(titleAppBar: 'Sign in', onTap: () {  GoRouter.of(context).push("/login"); },) ,
      body: SafeArea(child:
          RegisterBody()
      ),
    );
  }
}
