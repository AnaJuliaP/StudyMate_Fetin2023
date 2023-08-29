import 'package:flutter/material.dart';
import 'package:studymate_project_fetin/screens/week_progress_screen.dart';
import '../components/menu_item.dart';
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
        title: Text('Progresso',),
        leading: Container(
          width: 100,
          height: 100,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                shape: RoundedRectangleBorder(),
                elevation: 0),
            child: const Icon(
              Icons.arrow_back,
              size: 25,
              color: Colors.white,
            ),
          ),
        ),
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
