class SharedPreferencesCode {
  static String map = 'MAP';
  static String list = 'LIST';
}

class SharedPreferencesName {
  static String searchActivityName = 'SEARCH_ACTIVITY_VIEW';
}

class SharedPreferences {
  String searchActivityView;

  static final SharedPreferences _sharedPreferences =
      SharedPreferences._internal();

  factory SharedPreferences() => _sharedPreferences;

  SharedPreferences._internal();
}
