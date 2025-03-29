import 'package:flutter/material.dart';
import 'package:food_guardian/features/account_feature/presentation/account_view/account_widgets/account_management_section.dart';
import 'package:food_guardian/features/account_feature/presentation/account_view/account_widgets/notification_section.dart';
import 'package:food_guardian/features/account_feature/presentation/account_view/account_widgets/notifications_list.dart';
import 'package:food_guardian/features/account_feature/presentation/account_view/account_widgets/profile_section.dart';

class AccountView extends StatefulWidget {
  const AccountView({super.key});

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ProfileSection(),
            SizedBox(
              height: 20,
            ),
            NotificationSection(),
            SizedBox(
              height: 20,
            ),
            NotificationsList(),
            SizedBox(
              height: 20,
            ),
            AccountManagementSection(),
          ],
        ),
      ),
    ]);
  }
}
