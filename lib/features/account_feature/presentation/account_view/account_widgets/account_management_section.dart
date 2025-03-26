import 'package:flutter/material.dart';

class AccountManagementSection extends StatelessWidget {
  const AccountManagementSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
      child: ListTile(
        title: Text("Account Management"),
        leading: Icon(Icons.account_circle),
      ),
    );
  }
}
