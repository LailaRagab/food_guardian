import 'package:flutter/material.dart';
import 'package:food_guardian/core/utils/assets/fonts.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/assets/colors.dart';

class SplashSignInButton extends StatelessWidget {
  const SplashSignInButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          GoRouter.of(context).push("/login");
        },
        child: Container(
          width: 146,
          height: 48,
          decoration: BoxDecoration(
            color: AppColors.kWhite,
            borderRadius: BorderRadius.circular(17),
          ),
          child: Center(
              child: Text("Sign in",
                  style: AppFonts.fontWhite20
                      .copyWith(color: AppColors.kPrimary))),
        ),
      ),
    );
  }
}
