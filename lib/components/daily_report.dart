class DailyReport {
  DateTime date;
  int tasksCompleted = 0;

  DailyReport(this.date);

  void taskCompleted() {
    tasksCompleted++;
  }
}
