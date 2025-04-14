import 'package:flutter/material.dart';
import 'package:food_guardian/core/utils/assets/colors.dart';
import 'package:food_guardian/features/notifications_feature/notifications_models/for_passing_switch_state.dart';

class NotificationSection extends StatefulWidget {
  const NotificationSection({super.key});

  @override
  State<NotificationSection> createState() => _NotificationSectionState();
}

class _NotificationSectionState extends State<NotificationSection> {
  late bool notificationsEnabled;

  @override
  void initState() {
    super.initState();
    notificationsEnabled = ForPassingSwitchState.instance.getSwitchValue;
  }

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
            ForPassingSwitchState.instance.setSwitchValue(newValue);
          });
        },
        secondary: const Icon(Icons.notifications),
      ),
    );
  }
}
