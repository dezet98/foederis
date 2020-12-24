class SharedPreferencesSearchActivityCode {
  static const String map = 'MAP';
  static const String list = 'LIST';
}

class SharedPreferencesName {
  static const String searchActivityName = 'SEARCH_ACTIVITY_VIEW';
  static const String distanceKm = "DISTANCE_KM";
  static const String geohash = "GEOHASH";
  static const String address = "ADDRESS";

  static List<String> get props =>
      [searchActivityName, distanceKm, geohash, address];
}

class SharedPreferences {
  String _searchActivityView;
  String _distanceKm;
  String _geohash;
  String _address;

  static final SharedPreferences _sharedPreferences =
      SharedPreferences._internal();

  factory SharedPreferences() => _sharedPreferences;

  SharedPreferences._internal();

  String get searchActivityView => _searchActivityView;
  String get distanceKm => _distanceKm;
  String get geohash => _geohash;
  String get address => _address;

  void setPreferencesCode(
      String sharedPreferencesName, String sharedPreferenceValue) {
    switch (sharedPreferencesName) {
      case SharedPreferencesName.searchActivityName:
        _searchActivityView = sharedPreferenceValue;
        break;
      case SharedPreferencesName.distanceKm:
        _distanceKm = sharedPreferenceValue;
        break;
      case SharedPreferencesName.geohash:
        _geohash = sharedPreferenceValue;
        break;
      case SharedPreferencesName.address:
        _address = sharedPreferenceValue;
        break;
    }
  }
}
