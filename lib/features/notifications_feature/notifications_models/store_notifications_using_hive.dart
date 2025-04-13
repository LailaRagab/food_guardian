// 4
import 'package:hive_flutter/adapters.dart';

part 'store_notifications_using_hive.g.dart';

@HiveType(typeId: 2)
class NotificationModel extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String body;

  @HiveField(3)
  final DateTime time;

  NotificationModel({
    required this.id,
    required this.title,
    required this.body,
    required this.time,
  });
}
