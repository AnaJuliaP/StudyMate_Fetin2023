import 'package:flutter/material.dart';
import 'package:studymate_project_fetin/screens/initial_screen.dart';
import 'package:studymate_project_fetin/screens/menu_screen.dart';
import 'package:studymate_project_fetin/screens/login_screen.dart';

import 'data/task_inherited.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Navigator(
          onGenerateRoute: (settings) {
            Widget? page;
            if (settings.name == '/') {
              page = LoginScreen();
            } else if (settings.name == '/MenuScreen') {
              page = MenuScreen();
            } else if (settings.name == '/InitialScreen') {
              page = TaskInherited(child: const InitialScreen());
            }
            return MaterialPageRoute(builder: (_) => page!);
          },
        ));
  }
}
