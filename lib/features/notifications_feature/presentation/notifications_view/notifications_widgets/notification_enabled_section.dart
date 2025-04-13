import 'package:flutter/material.dart';
import 'package:food_guardian/core/utils/assets/colors.dart';

class NotificationSection extends StatefulWidget {
  const NotificationSection({super.key});

  @override
  State<NotificationSection> createState() => _NotificationSectionState();
}

class _NotificationSectionState extends State<NotificationSection> {
  bool notificationsEnabled = true;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
      child: SwitchListTile(
        activeTrackColor: AppColors.kBlack,
        title: const Text('Enable Notifications'),
        value: notificationsEnabled,
        onChanged: (newValue) {
          setState(() {
            notificationsEnabled = newValue;
            // TODO: Handle enabling/disabling notifications here
          });
        },
        secondary: const Icon(Icons.notifications),
      ),
    );
  }
}
