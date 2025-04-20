class ForPassingItemStateToDashboard {
  double? freshCount;
  double? usedCount;
  double? expiredCount;
  double? expireSoonCount;

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
  // Set <double> setUsedCount = usedCount;

  double? get getExpiredCount => expiredCount;

  void setExpiredCount(double value) {
    expiredCount = value;
  }

  double? get getExpireSoonCount => expireSoonCount;

  void setExpireSoonCount(double value) {
    expireSoonCount = value;
  }
}
