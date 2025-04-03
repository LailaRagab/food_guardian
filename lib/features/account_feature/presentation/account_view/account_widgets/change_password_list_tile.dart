import 'package:flutter/material.dart';

import '../../account_view_model/edit_password_logic.dart';
import 'account_management_shared_list_tile.dart';

class ChangePasswordListTile extends StatelessWidget {
  const ChangePasswordListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return AccountManagementSharedListTile(
      title: 'Change Password',
      icon: Icons.password,
      onTap: EditPasswordLogic(),
    );
  }
}
