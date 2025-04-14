//2 for switch
import 'package:hive/hive.dart';

class ForPassingSwitchState {
  static final ForPassingSwitchState instance =
      ForPassingSwitchState._internal();
  static const String boxName = 'switchState';
  static const String key = 'notifications_enabled';

  ForPassingSwitchState._internal();

  /// Get the value from Hive
  bool get getSwitchValue {
    final box = Hive.box(boxName);
    return box.get(key, defaultValue: true); // default to true
  }

  /// Save the value to Hive
  void setSwitchValue(bool value) {
    final box = Hive.box(boxName);
    box.put(key, value);
  }
}
