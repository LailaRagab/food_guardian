import 'package:flutter/material.dart';
import 'package:food_guardian/core/utils/assets/colors.dart';
import 'package:food_guardian/features/account_feature/presentation/account_view/account_widgets/account_actions_expansion_tile.dart';
import 'package:food_guardian/features/account_feature/presentation/account_view/account_widgets/profile_management_expansion_tile.dart';

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
            leading: Icon(Icons.manage_accounts_sharp),
            iconColor: AppColors.kBlack,
            children: [
              ProfileManagementExpansionTile(),
              AccountActionsExpansionTile()
            ],
          ),
        ));
  }
}
