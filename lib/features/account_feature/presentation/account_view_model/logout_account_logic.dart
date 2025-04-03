import 'package:flutter/material.dart';
import 'package:food_guardian/features/account_feature/presentation/account_view/account_widgets/shared_alert_dialog.dart';
import 'package:go_router/go_router.dart';

class LogoutAccountLogic extends StatelessWidget {
  const LogoutAccountLogic({super.key});

  @override
  Widget build(BuildContext context) {
    return SharedAlertDialog(
        alertDialogTitle: "Logout !",
        columnChildren: [],
        elevatedButtonText: "Yes",
        onPressedElevatedButton: () async {
          await GoRouter.of(context).push("/login");
          Navigator.pop(context);
        });
  }
}
