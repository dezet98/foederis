class SharedPreferencesCode {
  static const String map = 'MAP';
  static const String list = 'LIST';
  static const String distanceKm = "30";
}

class SharedPreferencesName {
  static const String searchActivityName = 'SEARCH_ACTIVITY_VIEW';
  static const String distanceKm = "DISTANCE_KM";
}

class SharedPreferences {
  String _searchActivityView;
  String _distanceKm;

  static final SharedPreferences _sharedPreferences =
      SharedPreferences._internal();

  factory SharedPreferences() => _sharedPreferences;

  SharedPreferences._internal();

  String get searchActivityView => _searchActivityView;
  String get distanceKm => _distanceKm;

  void setPreferencesCode(
      String sharedPreferencesName, String sharedPreferencesCode) {
    switch (sharedPreferencesName) {
      case 'SEARCH_ACTIVITY_VIEW':
        _searchActivityView = sharedPreferencesCode;
        break;
      case 'DISTANCE_KM':
        _distanceKm = sharedPreferencesCode;
        break;
    }
  }
}
