import 'package:flutter/material.dart';
import 'package:food_guardian/core/utils/assets/fonts.dart';

import '../../../../../core/utils/assets/colors.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({super.key, required this.onTap,});

final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 146,
          height: 48,
          decoration: BoxDecoration(
            color: AppColors.kPrimary,
            borderRadius: BorderRadius.circular(17),
          ),
          child: Center(
              child: Text("Register", style: AppFonts.fontWhite20)
          ),
        ),
      ),
    );
  }
}
