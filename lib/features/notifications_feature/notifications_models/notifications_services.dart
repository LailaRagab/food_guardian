import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:food_guardian/features/notifications_feature/notifications_models/store_notifications_using_hive.dart';
import 'package:hive_flutter/adapters.dart';

class NotificationService {
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> init() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  static Future<void> scheduleNotification({
    //This part that will display in the notification section
    required int id,
    required String title,
    required String body,
    required DateTime scheduledDate,
  }) async {
    // This part will display in the top of screen
    await flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'main_channel',
          'Main Notifications',
          importance: Importance.max,
          priority: Priority.high,
        ),
      ),
    );

    // 6x
    // Save it in Hive
    final box = Hive.box<NotificationModel>('notifications');
    box.put(
        id,
        NotificationModel(
          id: id,
          title: title,
          body: body,
          time: scheduledDate,
        ));
  }
}
