import "package:food_guardian/features/notifications_feature/notifications_models/fetch_item_expire_soon_logic.dart";

Future<void> scheduleAllNotifications() async {
  await FetchItemExpireSoonLogic.fetchItemExpireSoonFun();
}
