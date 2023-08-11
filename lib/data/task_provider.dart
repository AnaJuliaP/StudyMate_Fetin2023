import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/task.dart';

class TaskProvider extends ChangeNotifier {
  List<Task> _taskList = [
    Task('Aprender Flutter', 'assets/images/dash.png', 3),
    Task('Andar de Bike', 'assets/images/bike.webp', 2),
    Task('Meditar', 'assets/images/meditar.jpeg', 5),
    Task('Ler', 'assets/images/livro.jpg', 4),
  ];

  List<Task> get taskList => _taskList;

  void addTask(Task task) {
    _taskList.add(task);
    notifyListeners();
  }

  void removeTask(String name, String photo, int difficulty) {
    taskList.removeWhere(
      (task) =>
          task.nome == name &&
          task.foto == photo &&
          task.dificuldade == difficulty,
    );
    notifyListeners();
  }

  void markTaskAsCompleted(String name){
    final task = _taskList.firstWhere((task) => task.nome == name);
    task.concluida = true;
    notifyListeners();
  }
}
