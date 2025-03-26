import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_guardian/core/utils/assets/colors.dart';
import 'package:food_guardian/core/utils/assets/fonts.dart';
import 'package:food_guardian/core/utils/assets/images.dart';
import 'package:food_guardian/core/widgets/custom_text.dart';
import 'package:food_guardian/features/account_feature/presentation/account_view/account_widgets/profile_photo_account.dart';

class ProfileSection extends StatelessWidget {
  ProfileSection({super.key});

  User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfilePhotoAccount(),
        SizedBox(
          height: 10,
        ),
        CustomText(
            text: user?.displayName ?? "No Name", style: AppFonts.fontBlack18),
        SizedBox(
          height: 10,
        ),
        CustomText(
            text: user?.email ?? "Email not found",
            style: AppFonts.font16.copyWith(color: AppColors.kGrey)),
      ],
    );
  }
}
