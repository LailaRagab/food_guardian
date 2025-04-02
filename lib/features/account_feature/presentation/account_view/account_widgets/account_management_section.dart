import 'package:flutter/material.dart';
import 'package:food_guardian/core/utils/assets/colors.dart';
import 'package:food_guardian/features/account_feature/presentation/account_view/account_widgets/account_management_shared_list_tile.dart';
import 'package:food_guardian/features/account_feature/presentation/account_view_model/edit_profile_logic.dart';

class AccountManagementSection extends StatefulWidget {
  const AccountManagementSection({super.key});

  @override
  State<AccountManagementSection> createState() =>
      _AccountManagementSectionState();
}

class _AccountManagementSectionState extends State<AccountManagementSection> {
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
                  showDialog(
                      context: context,
                      builder: (context) {
                        return EditProfileLogic();
                      });
                },
              )
            ],
          ),
        ));
  }
}
