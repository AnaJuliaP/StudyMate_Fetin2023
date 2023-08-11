import 'package:sqflite/sqflite.dart';

import '../models/completed_task.dart';


class CompletedTaskDAO {
  final Database _db;

  CompletedTaskDAO(this._db);

  Future<void> insertCompletedTask(CompletedTask completedTask) async {
    await _db.insert(
      'completed_tasks',
      completedTask.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<CompletedTask>> getCompletedTasks() async {
    final List<Map<String, dynamic>> maps = await _db.query('completed_tasks');

    return List.generate(maps.length, (i) {
      return CompletedTask(
        id: maps[i]['id'],
        taskId: maps[i]['taskId'],
        completionDate: DateTime.parse(maps[i]['completionDate']),
        dailyReportId: maps[i]['dailyReportId'],
      );
    });
  }

}
