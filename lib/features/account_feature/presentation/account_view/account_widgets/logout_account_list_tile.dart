import 'package:flutter/material.dart';
import 'package:food_guardian/features/account_feature/presentation/account_view_model/logout_account_logic.dart';

import 'account_management_shared_list_tile.dart';

class LogoutAccountListTile extends StatelessWidget {
  const LogoutAccountListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return AccountManagementSharedListTile(
        title: "Logout", icon: Icons.logout, onTap: LogoutAccountLogic());
  }
}
