import 'package:flutter/material.dart';
import 'package:food_guardian/core/utils/app_router.dart';

void main() {
  runApp(const FoodGuardian());
}

class FoodGuardian extends StatelessWidget {
  const FoodGuardian({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
    );
  }
 }

