import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'shared_preferences.dart';

class DatabaseHelper {
  static final _databaseName = "database9.db";
  static final _databaseVersion = 1;

  static final DatabaseHelper instance = DatabaseHelper._internal();

  DatabaseHelper._internal();

  static Database _database;

  Future<Database> get database async =>
      _database != null ? _database : await _initDatabase();

  _initDatabase() async => await openDatabase(
        join(await getDatabasesPath(), _databaseName),
        version: _databaseVersion,
        onCreate: _onCreate,
      );

  Future _onCreate(Database db, int version) async {
    await db.execute('''
              CREATE TABLE USER_PREFERENCES(
                NAME STRING NOT NULL, 
                VALUE STRING NOT NULL
              )
              ''');
    await db.insert(
      'USER_PREFERENCES',
      {
        'NAME': SharedPreferencesName.searchActivityName,
        'VALUE': SharedPreferencesSearchActivityCode.list
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    await db.insert(
      'USER_PREFERENCES',
      {
        'NAME': SharedPreferencesName.distanceKm,
        'VALUE': '30',
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    await db.insert(
      'USER_PREFERENCES',
      {
        'NAME': SharedPreferencesName.geohash,
        'VALUE': 'u3qcnhhk3yy',
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    await db.insert(
      'USER_PREFERENCES',
      {
        'NAME': SharedPreferencesName.address,
        'VALUE': 'Warszawa, Poland',
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    await db.insert(
      'USER_PREFERENCES',
      {
        'NAME': SharedPreferencesName.languageCode,
        'VALUE': 'en',
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    await db.insert(
      'USER_PREFERENCES',
      {
        'NAME': SharedPreferencesName.countryCode,
        'VALUE': 'US',
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<String> getUserPreferences(String sharedPreferencesName) async {
    Database db = await database;
    List<Map> maps = await db.query('USER_PREFERENCES',
        columns: [
          'NAME',
          'VALUE',
        ],
        where: 'NAME = ?',
        whereArgs: [sharedPreferencesName]);
    return maps.first['VALUE'].toString();
  }

  Future<int> updateUserPreferences(
    String sharedPreferencesName,
    String sharedPreferencesValue,
  ) async {
    Database db = await database;
    int result = await db.update(
      'USER_PREFERENCES',
      {
        'VALUE': sharedPreferencesValue,
      },
      where: 'NAME = ?',
      whereArgs: [sharedPreferencesName],
    );

    return result;
  }
}
