import 'package:flutter/material.dart';
import 'package:food_guardian/features/account_feature/presentation/account_view_model/delete_account_logic.dart';

import 'account_management_shared_list_tile.dart';

class DeleteAccountListTile extends StatelessWidget {
  const DeleteAccountListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return AccountManagementSharedListTile(
      title: "Delete Account",
      icon: Icons.delete_forever,
      onTap: DeleteAccountLogic(),
    );
  }
}
