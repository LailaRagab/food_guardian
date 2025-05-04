import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_guardian/features/authentication_feature/register_feature/presentation/register_view/register_widgets/auth_app_bar.dart';
import 'package:food_guardian/core/utils/snack_bar.dart';
import 'package:food_guardian/features/authentication_feature/register_feature/presentation/register_view/register_widgets/register_body.dart';
import 'package:food_guardian/features/authentication_feature/register_feature/presentation/register_view_model/register_cubit/register_cubit.dart';
import 'package:food_guardian/features/authentication_feature/register_feature/presentation/register_view_model/register_cubit/register_states.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});

  bool isLoaded = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (BuildContext context, state) {
        if (state is LoadingState) {
          isLoaded = true;
        } else if (state is SuccessState) {
          GoRouter.of(context).push("/home");
          isLoaded = false;
        } else if (state is FailureState) {
          snackBar(context, state.errorMessage, null);
          isLoaded = false;
        }
      },
      builder: (BuildContext context, Object? state) => ModalProgressHUD(
        inAsyncCall: isLoaded,
        child: SafeArea(
          child: Scaffold(
            appBar: AuthAppBar(
              titleAppBar: 'Sign in',
              onTap: () {
                GoRouter.of(context).push("/login");
              },
            ),
            body: RegisterBody(),
          ),
        ),
      ),
    );
  }
}
