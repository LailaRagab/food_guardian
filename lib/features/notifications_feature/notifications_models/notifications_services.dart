import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:food_guardian/features/notifications_feature/notifications_models/store_notifications_using_hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> init() async {
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);

    tz.initializeTimeZones(); // Required for scheduling
  }

  static Future<void> scheduleNotification({
    required int id,
    required String title,
    required String body,
    required DateTime scheduledDate,
  }) async {
    print("mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm");
    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(scheduledDate, tz.local),
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'main_channel',
          'Main Notifications',
          importance: Importance.max,
          priority: Priority.high,
        ),
      ),
      matchDateTimeComponents: DateTimeComponents.dateAndTime,
      androidScheduleMode:
          AndroidScheduleMode.exactAllowWhileIdle, // ✅ required now
    );

    // 6
    // 🧠 Save it in Hive
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
