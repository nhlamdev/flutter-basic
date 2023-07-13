import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;

  static late Database _database;

  DatabaseHelper.internal();

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }

    _database = await initDatabase();
    return _database;
  }

  Future<Database> initDatabase() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'mydatabase.db');

    // Open/create the database at a given path
    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        // Create the necessary tables
        await db.execute(
          'CREATE TABLE works (id INTEGER PRIMARY KEY, name TEXT, phone TEXT)',
        );
      },
    );
  }

  // Define your database operations (e.g., insert, update, delete, query) here
  // ...
}
