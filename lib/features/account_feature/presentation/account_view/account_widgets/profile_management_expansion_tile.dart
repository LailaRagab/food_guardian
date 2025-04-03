import 'package:flutter/material.dart';
import 'package:food_guardian/features/account_feature/presentation/account_view/account_widgets/change_password_list_tile.dart';
import 'package:food_guardian/features/account_feature/presentation/account_view/account_widgets/edit_profile_list_tile.dart';

import '../../../../../core/utils/assets/colors.dart';

class ProfileManagementExpansionTile extends StatelessWidget {
  const ProfileManagementExpansionTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text("Profile Management"),
      leading: Icon(Icons.account_circle),
      iconColor: AppColors.kBlack,
      children: [EditProfileListTile(), ChangePasswordListTile()],
    );
  }
}
