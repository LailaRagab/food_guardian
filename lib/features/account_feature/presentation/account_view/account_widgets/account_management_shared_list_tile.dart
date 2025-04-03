import 'package:flutter/material.dart';

class AccountManagementSharedListTile extends StatelessWidget {
  const AccountManagementSharedListTile(
      {super.key,
      required this.title,
      required this.icon,
      required this.onTap});
  final String title;
  final IconData icon;
  final Widget onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: Icon(icon),
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return onTap;
            });
      },
    );
  }
}
