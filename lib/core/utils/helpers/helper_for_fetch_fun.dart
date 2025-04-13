import '../../../features/notifications_feature/presentation/notifications_view_model/fetch_item_expire_soon_logic.dart';

Future<void> scheduleAllNotifications() async {
  await FetchItemExpireSoonLogic.fetchItemExpireSoonFun();
}
