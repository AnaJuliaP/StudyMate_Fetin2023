import 'package:flutter/foundation.dart';

import '../database/database_helper.dart';
import '../models/completed_task.dart';
import '../models/task_model.dart';


class CompletedTaskProvider with ChangeNotifier {
  List<CompletedTaskModel> _completedTasks = [];
  final DBHelper _dbHelper = DBHelper();

  List<CompletedTaskModel> get completedTasks => _completedTasks;

  Future<void> addCompletedTask(TaskModel task) async {
    final completedTask = CompletedTaskModel(
      id: _completedTasks.length + 1, // Pode ser gerado automaticamente pelo DB
      name: task.name,
      difficulty: task.difficulty,
      completionDate: DateTime.now(),
    );

    _completedTasks.add(completedTask);
    notifyListeners();

    await _dbHelper.insertCompletedTask(completedTask); // Inserir no DB
  }
}