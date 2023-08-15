class DailyReport {
  final int id;
  final DateTime reportDate;
  int completedTasksCount;
  final int totalPlannedTasks;

  DailyReport({
    required this.id,
    required this.reportDate,
    required this.completedTasksCount,
    required this.totalPlannedTasks,
  });

  void taskCompleted() {
    completedTasksCount++;
  }
}
