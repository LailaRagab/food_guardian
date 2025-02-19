import 'package:flutter/material.dart';
import 'package:food_guardian/core/widgets/common_button.dart';
import 'package:food_guardian/features/splash_feature/presentation/splash_view/splash_widgets/splash_sign_in_button.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/assets/images.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            AppImages.bgSplash,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(bottom: 127,left: 0, right: 0, child: CommonButton(onTap: () {GoRouter.of(context).push("/register");},)),
        Positioned( bottom: 60,left: 0, right: 0,child: SplashSignInButton())
      ],
    );
  }
}
