import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:food_guardian/core/utils/assets/colors.dart';
import '../../../notifications_models/store_notifications_using_hive.dart';

// 7

class NotificationsList extends StatelessWidget {
  const NotificationsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(35),
      ),
      child: ExpansionTile(
        title: const Text("Notifications List"),
        leading: const Icon(Icons.notifications_active),
        iconColor: AppColors.kBlack,
        children: [
          ValueListenableBuilder(
            valueListenable:
                Hive.box<NotificationModel>('notifications').listenable(),
            builder: (context, Box<NotificationModel> box, _) {
              if (box.isEmpty) {
                return const ListTile(
                  title: Text("No notifications yet"),
                );
              }

              return Column(
                children: box.values.map((notif) {
                  return ListTile(
                    leading: const Icon(Icons.notifications),
                    title: Text(notif.title),
                    subtitle: Text(notif.time.toString()),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => box.delete(notif.id),
                    ),
                  );
                }).toList(),
              );
            },
          )
        ],
      ),
    );
  }
}
