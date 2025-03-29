import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_guardian/core/utils/assets/colors.dart';
import 'package:food_guardian/features/account_feature/presentation/account_view/account_widgets/account_management_shared_list_tile.dart';
import 'package:food_guardian/features/account_feature/presentation/account_view_model/edit_profile_logic.dart';

class AccountManagementSection extends StatelessWidget {
  const AccountManagementSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
        child: Theme(
          data:
              Theme.of(context).copyWith(dividerColor: AppColors.kTransparent),
          child: ExpansionTile(
            title: Text("Account Management"),
            leading: Icon(Icons.account_circle),
            children: [
              AccountManagementSharedListTile(
                title: 'Edit Profile',
                icon: Icons.edit,
                onTap: () {
                  EditProfileLogic.buildEditProfileShowDialog(context);
                },
              )
            ],
          ),
        ));
  }
}
