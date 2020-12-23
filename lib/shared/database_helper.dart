import 'package:engineering_thesis/shared/shared_preferences.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final _databaseName = "database5.db";
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
                CODE STRING NOT NULL
              )
              ''');
    await db.insert(
        'USER_PREFERENCES',
        {
          'NAME': SharedPreferencesName.searchActivityName,
          'CODE': SharedPreferencesCode.list
        },
        conflictAlgorithm: ConflictAlgorithm.replace);
    await db.insert('USER_PREFERENCES', {'NAME': 'THEME', 'CODE': 'LIGHT'},
        conflictAlgorithm: ConflictAlgorithm.replace);
    await db.insert(
        'USER_PREFERENCES',
        {
          'NAME': SharedPreferencesName.distanceKm,
          'CODE': SharedPreferencesCode.distanceKm
        },
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<String> getUserPreferences(String sharedPreferencesName) async {
    Database db = await database;
    List<Map> maps = await db.query('USER_PREFERENCES',
        columns: [
          'NAME',
          'CODE',
        ],
        where: 'NAME = ?',
        whereArgs: [sharedPreferencesName]);
    // if (maps.length > 0 && maps.first['CODE'] == 'MAP') {
    //   return SharedPreferencesCode.map;
    // }
    // return SharedPreferencesCode.list;
    return maps.first['CODE'].toString();
  }

  Future<int> updateUserPreferences(
    String sharedPreferencesName,
    String sharedPreferencesCode,
  ) async {
    Database db = await database;
    int result = await db.update(
      'USER_PREFERENCES',
      {
        'CODE': sharedPreferencesCode,
      },
      where: 'NAME = ?',
      whereArgs: [sharedPreferencesName],
    );

    return result;
  }
}
