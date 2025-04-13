import 'package:flutter/material.dart';
import 'package:food_guardian/core/utils/assets/colors.dart';
import 'package:food_guardian/features/account_feature/presentation/account_view/account_widgets/delete_account_list_tile.dart';
import 'package:food_guardian/features/account_feature/presentation/account_view/account_widgets/logout_account_list_tile.dart';

class AccountActionsExpansionTile extends StatelessWidget {
  const AccountActionsExpansionTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text("Account Actions"),
      leading: Icon(Icons.build),
      iconColor: AppColors.kBlack,
      children: [DeleteAccountListTile(), LogoutAccountListTile()],
    );
  }
}
