import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_guardian/features/account_feature/presentation/account_view/account_widgets/profile_photo_account.dart';

import '../../../../../core/utils/assets/colors.dart';
import '../../../../../core/utils/assets/fonts.dart';
import '../../../../../core/widgets/custom_text.dart';

class ProfileSection extends StatelessWidget {
  final VoidCallback onProfileUpdated;

  ProfileSection({super.key, required this.onProfileUpdated});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.userChanges(), // Listen for auth changes
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Show loading indicator while waiting
        }

        if (!snapshot.hasData) {
          return Text("No user data available.");
        }

        User? user = snapshot.data;

        return Column(
          children: [
            ProfilePhotoAccount(),
            SizedBox(height: 10),
            CustomText(
              text: user?.displayName ?? "No Name",
              style: AppFonts.fontBlack18,
            ),
            SizedBox(height: 10),
            CustomText(
              text: user?.email ?? "Email not found",
              style: AppFonts.font16.copyWith(color: AppColors.kGrey),
            ),
          ],
        );
      },
    );
  }
}
