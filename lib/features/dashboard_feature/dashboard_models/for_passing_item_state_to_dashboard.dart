class ForPassingItemStateToDashboard {
  double? freshCount;
  double? usedCount;
  double? expiredCount;
  double? expireSoonCount;
  int? totalItems;
  int? fridgeCount;
  int? freezerCount;
  int? pantryCount;

  int? get getFridgeCount => fridgeCount;

  void setFridgeCount(int value) {
    fridgeCount = value;
  }

  int? get getFreezerCount => freezerCount;

  void setFreezerCount(int value) {
    freezerCount = value;
  }

  int? get getPantryCount => pantryCount;

  void setPantryCount(int value) {
    pantryCount = value;
  }

  int? get getTotalItems => totalItems;

  void setTotalItems(int value) {
    totalItems = value;
  }

  static ForPassingItemStateToDashboard forPassingItemStateToDashboard =
      ForPassingItemStateToDashboard();

  double? get getFreshCount => freshCount;

  void setFreshCount(double value) {
    freshCount = value;
  }

  double? get getUsedCount => usedCount;

  void setUsedCount(double value) {
    usedCount = value;
  }

  double? get getExpiredCount => expiredCount;

  void setExpiredCount(double value) {
    expiredCount = value;
  }

  double? get getExpireSoonCount => expireSoonCount;

  void setExpireSoonCount(double value) {
    expireSoonCount = value;
  }
}
