import 'package:flutter/cupertino.dart';

class SharedPreferencesCode {
  static String map = 'MAP';
  static String list = 'LIST';
}

class SharedPreferencesName {
  static String searchActivityName = 'SEARCH_ACTIVITY_VIEW';
}

class SharedPreferences {
  String searchActivityView;

  SharedPreferences({@required this.searchActivityView});
}
