import 'package:flutter/material.dart';
import 'package:food_guardian/features/splash_feature/presentation/splash_view/splash_widgets/splash_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: SplashBody()),
    );
  }
}
