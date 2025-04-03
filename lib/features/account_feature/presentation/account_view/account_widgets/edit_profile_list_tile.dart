import 'package:flutter/material.dart';

import '../../account_view_model/edit_profile_logic.dart';
import 'account_management_shared_list_tile.dart';

class EditProfileListTile extends StatelessWidget {
  const EditProfileListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return AccountManagementSharedListTile(
      title: 'Edit Profile',
      icon: Icons.edit,
      onTap: EditProfileLogic(),
    );
  }
}
