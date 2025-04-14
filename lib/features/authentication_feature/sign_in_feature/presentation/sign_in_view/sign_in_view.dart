import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_guardian/features/authentication_feature/register_feature/presentation/register_view/register_widgets/auth_app_bar.dart';
import 'package:food_guardian/core/utils/snack_bar.dart';
import 'package:food_guardian/features/authentication_feature/sign_in_feature/presentation/sign_in_view/sign_in_widgets/sign_in_body.dart';
import 'package:food_guardian/features/authentication_feature/sign_in_feature/presentation/sign_in_view_model/sign_in_cubit/sign_in_cubit.dart';
import 'package:food_guardian/features/authentication_feature/sign_in_feature/presentation/sign_in_view_model/sign_in_cubit/sign_in_states.dart';
import 'package:food_guardian/features/notifications_feature/notifications_models/for_passing_switch_state.dart';
import 'package:food_guardian/features/notifications_feature/notifications_models/store_notifications_using_hive.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../core/utils/helpers/helper_for_fetch_fun.dart';

class SignInView extends StatefulWidget {
  SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  bool isLoaded = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInStates>(
      listener: (context, state) {
        if (state is SignInLoading) {
          isLoaded = true;
        } else if (state is SignInSuccess) {
          GoRouter.of(context).push("/home");
          isLoaded = false; // ✅ Schedule only when user is known
          NotificationModel.clearLocalNotificationsOnLogin();
          if (ForPassingSwitchState.instance.getSwitchValue) {
            scheduleAllNotifications();
          }
        } else if (state is SignInFailure) {
          snackBar(context, state.errorMessage, null);
          isLoaded = false;
        }
      },
      builder: (context, state) => ModalProgressHUD(
        inAsyncCall: isLoaded,
        child: SafeArea(
          child: Scaffold(
            appBar: AuthAppBar(
              titleAppBar: 'Register',
              onTap: () {
                GoRouter.of(context).push("/register");
              },
            ),
            body: SignInBody(),
          ),
        ),
      ),
    );
  }
}
