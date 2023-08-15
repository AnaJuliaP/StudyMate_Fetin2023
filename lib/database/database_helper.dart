import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../models/completed_task.dart';


class DBHelper {
  static Database? _database;
  static final _dbName = 'completed_tasks.db';
  static final _dbVersion = 1;
  static final _tableName = 'completed_tasks';

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, _dbName);

    return await openDatabase(
      path,
      version: _dbVersion,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE $_tableName (
            id INTEGER PRIMARY KEY,
            name TEXT,
            difficulty INTEGER,
            completion_date TEXT
          )
        ''');
      },
    );
  }

  Future<void> insertCompletedTask(CompletedTaskModel task) async {
    final db = await database;
    await db.insert(
      _tableName,
      task.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
