class CompletedTask {
  final int id;
  final int taskId;
  final DateTime completionDate;
  final int dailyReportId;

  CompletedTask({
    required this.id,
    required this.taskId,
    required this.completionDate,
    required this.dailyReportId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'taskId': taskId,
      'completionDate': completionDate.toIso8601String(),
      'dailyReportId': dailyReportId,
    };
  }
}
