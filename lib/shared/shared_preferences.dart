class SharedPreferencesSearchActivityCode {
  static const String map = 'MAP';
  static const String list = 'LIST';
}

class SharedPreferencesName {
  static const String searchActivityName = 'SEARCH_ACTIVITY_VIEW';
  static const String distanceKm = "DISTANCE_KM";
  static const String geohash = "GEOHASH";
  static const String address = "ADDRESS";
  static const String languageCode = "LANGUAGE_CODE";
  static const String countryCode = "COUNTRY_CODE";

  static List<String> get props => [
        searchActivityName,
        distanceKm,
        geohash,
        address,
        countryCode,
        languageCode
      ];
}

class SharedPreferences {
  String _searchActivityView;
  String _distanceKm;
  String _geohash;
  String _address;
  String _languageCode;
  String _countryCode;

  static final SharedPreferences _sharedPreferences =
      SharedPreferences._internal();

  factory SharedPreferences() => _sharedPreferences;

  SharedPreferences._internal();

  String get searchActivityView => _searchActivityView;
  String get distanceKm => _distanceKm;
  String get geohash => _geohash;
  String get address => _address;
  String get languageCode => _languageCode;
  String get countryCode => _countryCode;

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
      case SharedPreferencesName.languageCode:
        _languageCode = sharedPreferenceValue;
        break;
      case SharedPreferencesName.countryCode:
        _countryCode = sharedPreferenceValue;
        break;
    }
  }
}
