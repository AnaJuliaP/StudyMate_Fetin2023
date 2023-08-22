import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studymate_project_fetin/screens/week_progress_screen.dart';
import '../components/menu_item.dart';
import '../data/completed_task_provider.dart';
import '../models/completed_task.dart';
import 'daily_report_screen.dart';

class MenuReportScreen extends StatefulWidget {
  @override
  _MenuReportScreenState createState() => _MenuReportScreenState();
}

class _MenuReportScreenState extends State<MenuReportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Progresso'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MenuItem(
              icon: Icons.today,
              title: 'Tarefas feitas no dia',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TasksMadeToday(),
                  ),
                );
              },
            ),
            MenuItem(
              icon: Icons.auto_graph_rounded,
              title: 'Tarefas da semana',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => WeeklyReportsScreen(),));
              },
            ),

          ],
        ),
      ),
    );
  }
}
