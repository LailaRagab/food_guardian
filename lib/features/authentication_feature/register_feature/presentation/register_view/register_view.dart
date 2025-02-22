import 'package:flutter/material.dart';
import 'package:food_guardian/features/authentication_feature/register_feature/presentation/register_view/register_widgets/auth_app_bar.dart';
import 'package:food_guardian/features/authentication_feature/register_feature/presentation/register_view/register_widgets/register_body.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterView extends StatefulWidget {
  RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  bool isLoaded = false;

  void getLoading(bool value) {
    setState(() {
      isLoaded = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoaded,
      child: Scaffold(
        appBar: AuthAppBar(
          titleAppBar: 'Sign in',
          onTap: () {
            GoRouter.of(context).push("/login");
          },
        ),
        body: SafeArea(
          child: RegisterBody(setLoading: getLoading),
        ),
      ),
    );
  }
}
