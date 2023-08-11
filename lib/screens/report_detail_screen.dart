import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/daily_report_provider.dart';

class ReportDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dailyReportProvider = Provider.of<DailyReportProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Report Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Detailed Report Information'),
            Text('Tasks Completed: ${dailyReportProvider.dailyReport.tasksCompleted}'),
            // Exiba outras informações do DailyReport aqui
          ],
        ),
      ),
    );
  }
}
