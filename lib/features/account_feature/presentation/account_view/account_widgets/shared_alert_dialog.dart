import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_text_button.dart';
import '../../../../../core/widgets/custom_elevated_button.dart';

class SharedAlertDialog extends StatelessWidget {
  const SharedAlertDialog({
    super.key,
    required this.alertDialogTitle,
    required this.columnChildren,
    required this.elevatedButtonText,
    required this.onPressedElevatedButton,
  });
  final String alertDialogTitle;
  final List<Widget> columnChildren;
  final VoidCallback onPressedElevatedButton;
  final String elevatedButtonText;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(alertDialogTitle),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ...columnChildren,
        ],
      ),
      actions: [
        CustomElevatedButton(
          onPressed: onPressedElevatedButton,
          text: elevatedButtonText,
        ),
        CustomTextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            text: "Cancel"),
      ],
    );
    ;
  }
}
