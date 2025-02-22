import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_guardian/features/authentication_feature/register_feature/presentation/register_view/register_widgets/auth_app_bar.dart';
import 'package:food_guardian/features/authentication_feature/register_feature/presentation/register_view/register_widgets/auth_snack_bar.dart';
import 'package:food_guardian/features/authentication_feature/sign_in_feature/presentation/sign_in_view/sign_in_widgets/sign_in_body.dart';
import 'package:food_guardian/features/authentication_feature/sign_in_feature/presentation/sign_in_view_model/sign_in_cubit/sign_in_cubit.dart';
import 'package:food_guardian/features/authentication_feature/sign_in_feature/presentation/sign_in_view_model/sign_in_cubit/sign_in_states.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignInView extends StatelessWidget {
  SignInView({super.key});

  bool isLoaded = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInStates>(
      listener: (BuildContext context, Object? state) {
        if (state is SignInLoading) {
          isLoaded = true;
        } else if (state is SignInSuccess) {
          GoRouter.of(context).push("/home");
        } else if (state is SignInFailure) {
          snackBar(context, state.messageError);
        }
        isLoaded = false;
      },
      builder: (BuildContext context, state) => ModalProgressHUD(
        inAsyncCall: isLoaded,
        child: Scaffold(
          appBar: AuthAppBar(
            titleAppBar: 'Register',
            onTap: () {
              GoRouter.of(context).push("/register");
            },
          ),
          body: SafeArea(child: SignInBody()),
        ),
      ),
    );
  }
}
