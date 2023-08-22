import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../data/completed_task_provider.dart';
import '../models/completed_task.dart';

class WeeklyReportsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final completedTaskProvider = Provider.of<CompletedTaskProvider>(context);

    List<CompletedTaskModel> completedTasks = completedTaskProvider.completedTasks;
    Map<int, List<CompletedTaskModel>> tasksByWeek = organizeTasksByWeek(completedTasks);

    return Scaffold(
      appBar: AppBar(
        title: Text('Tarefas da semana'),
      ),
      body: ListView.builder(
        itemCount: tasksByWeek.keys.length,
        itemBuilder: (context, index) {
          int weekOfYear = tasksByWeek.keys.elementAt(index);
          List<CompletedTaskModel> tasksInWeek = tasksByWeek[weekOfYear]!;

          return WeekTasksCard(weekOfYear: weekOfYear, tasks: tasksInWeek);
        },
      ),
    );
  }

  Map<int, List<CompletedTaskModel>> organizeTasksByWeek(List<CompletedTaskModel> completedTasks) {
    Map<int, List<CompletedTaskModel>> tasksByWeek = {};

    for (CompletedTaskModel task in completedTasks) {
      int weekOfYear = getWeekOfYear(task.completionDate);

      if (tasksByWeek.containsKey(weekOfYear)) {
        tasksByWeek[weekOfYear]!.add(task);
      } else {
        tasksByWeek[weekOfYear] = [task];
      }
    }

    return tasksByWeek;
  }

  int getWeekOfYear(DateTime date) {
    int dayOfYear = int.parse(DateFormat('D').format(date));
    int weekOfYear = ((dayOfYear - date.weekday + 10) / 7).floor();
    return weekOfYear;
  }
}

class WeekTasksCard extends StatelessWidget {
  final int weekOfYear;
  final List<CompletedTaskModel> tasks;

  WeekTasksCard({required this.weekOfYear, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Semana $weekOfYear'),
            SizedBox(height: 8),
            Column(
              children: tasks.map((task) {
                return Text('${task.name}');
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
