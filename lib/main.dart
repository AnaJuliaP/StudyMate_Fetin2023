import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studymate_project_fetin/data/completed_task_provider.dart';
import 'package:studymate_project_fetin/data/task_provider.dart';
import 'package:studymate_project_fetin/screens/initial_screen.dart';
import 'package:studymate_project_fetin/screens/menu_screen.dart';
import 'package:studymate_project_fetin/screens/login_screen.dart';
import 'package:studymate_project_fetin/store/pomodoro.store.dart';


void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => TaskProvider()),
      ChangeNotifierProvider(create: (context) => CompletedTaskProvider()),
      Provider<PomodoroStore>(
          create: (_) => PomodoroStore(),
      )

    ],
    child: const MyApp(),
  ));
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskProvider(),
      child: MaterialApp(
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
                page = InitialScreen();
              }
              return MaterialPageRoute(builder: (_) => page!);
            },
          )),
    );
  }
}
