import 'package:engineering_thesis/shared/database_helper.dart';
import 'package:engineering_thesis/shared/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class InitializeApp {
  static Future<void> initializeApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    await DotEnv().load('.env');
    await _initSharedPreferences();
  }

  static Future<void> _initSharedPreferences() async {
    SharedPreferences sharedPreferences = SharedPreferences();
    DatabaseHelper databaseHelper = DatabaseHelper.instance;

    for (String sharedPreferenceName in SharedPreferencesName.props) {
      sharedPreferences.setPreferencesCode(sharedPreferenceName,
          await databaseHelper.getUserPreferences(sharedPreferenceName));
    }
  }
}
