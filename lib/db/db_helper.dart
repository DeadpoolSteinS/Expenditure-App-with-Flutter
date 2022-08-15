import 'package:exp_note/models/expenditure.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Database? _db;
  static const int _version = 1;
  static const String _tableName = "expenditures";

  static Future<void> initDb() async {
    if (_db != null) {
      return;
    }
    try {
      String path = '${await getDatabasesPath()}expenditures.db';
      _db = await openDatabase(
        path,
        version: _version,
        onCreate: (db, version) {
          return db.execute(
              "CREATE TABLE $_tableName(id INTEGER PRIMARY KEY AUTOINCREMENT, type STRING, desc STRING, price INTEGER , createdAt STRING)");
        },
      );
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  static Future<int> insert(Expenditure? exp) async {
    return await _db?.insert(_tableName, exp!.toJson()) ?? 1;
  }

  static Future<List<Map<String, dynamic>>> query() async {
    return await _db!.query(_tableName);
  }

  static Future<List<Map<String, dynamic>>> findQuery(
      String key, String inWhere) async {
    return await _db!.rawQuery(
        "SELECT * FROM $_tableName WHERE $inWhere LIKE '$key' ORDER BY $inWhere DESC");
  }

  // static Future<List<Map<String, dynamic>>> getReport(
  //     String key, String inWhere) async {
  //   return await _db!.rawQuery(
  //       "SELECT * FROM $_tableName WHERE $inWhere LIKE '$key' ORDER BY $inWhere DESC");
  // }
}
