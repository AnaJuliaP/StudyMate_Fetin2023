import 'package:flutter/material.dart';
import '../components/daily_report.dart';

class DailyReportProvider with ChangeNotifier {
  DailyReport _dailyReport = DailyReport(DateTime.now());

  DailyReport get dailyReport => _dailyReport;

  void taskCompleted() {
    _dailyReport.taskCompleted();
    notifyListeners();
  }
}
