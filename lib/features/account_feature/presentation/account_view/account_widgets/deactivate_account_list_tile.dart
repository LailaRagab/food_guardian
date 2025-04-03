import 'package:flutter/material.dart';
import 'package:food_guardian/features/account_feature/presentation/account_view_model/deactivate_account_logic.dart';

import 'account_management_shared_list_tile.dart';

class DeactivateAccountListTile extends StatelessWidget {
  const DeactivateAccountListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return AccountManagementSharedListTile(
        title: "Deactivate Account ",
        icon: Icons.remove_circle,
        onTap: DeactivateAccountLogic());
  }
}
