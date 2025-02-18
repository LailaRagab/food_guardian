import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/assets/images.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              AppImages.bgSplash,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 50,
            child: GestureDetector(
              onTap: () {
                GoRouter.of(context).push("register");
              },
              child: Container(
                width: 100,
                height: 35,
                color: Colors.green,
                child: const Center(
                    child: Text("Register",
                        style: TextStyle(color: Colors.white))),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
