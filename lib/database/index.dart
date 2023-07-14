import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CustomDatabase {
  static final CustomDatabase _instance = CustomDatabase.internal();
  factory CustomDatabase() => _instance;

  static Database? _db;

  Future<Database> get database async {
    if (_db != null) {
      return _db!;
    }

    _db = await initDatabase();
    return _db!;
  }

  CustomDatabase.internal();

  Future<Database> initDatabase() async {
    final databasesPath = await getDatabasesPath();
    // if (kDebugMode) {
    //   print('databasesPath : $databasesPath');
    // }
    final path = join(databasesPath, 'database1.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        // Create your tables here
        await db.execute(
          'CREATE TABLE works (id TEXT PRIMARY KEY, title TEXT, summary TEXT, completeTime TEXT,  importance TEXT, complete BOOLEAN DEFAULT 0 )',
        );
      },
    );
  }

  Future<int> insert(String tableName, Map<String, dynamic> data) async {
    final db = await database;
    return await db.insert(tableName, data);
  }

  Future<List<Map<String, dynamic>>> query(String tableName) async {
    final db = await database;
    return await db.query(tableName);
  }

  delete(String tableName, String id) async {
    final db = await database;
    return await db.delete(tableName, where: 'id = ? ', whereArgs: [id]);
  }
}
