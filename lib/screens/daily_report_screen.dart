import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/completed_task_provider.dart';
import '../models/completed_task.dart';

class TasksMadeToday extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final completedTaskProvider = Provider.of<CompletedTaskProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Tarefas Concluídas'),
      ),
      body: ListView.builder(
        itemCount: completedTaskProvider.completedTasks.length,
        itemBuilder: (context, index) {
          CompletedTaskModel completedTask =
          completedTaskProvider.completedTasks[index];
          return ListTile(
            title: Text(completedTask.name),
            subtitle: Text('Dificuldade: ${completedTask.difficulty}'),
            trailing: Text(
                'Concluída em: ${completedTask.completionDate.toString()}'),
          );
        },
      ),
    );
  }
}
