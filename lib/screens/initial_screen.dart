import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studymate_project_fetin/data/task_provider.dart';
import '../components/task.dart';
import 'form_screen.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  Widget buildTaskWidget(TaskComponent task) {
    return TaskComponent(
      task.nome,
      task.foto,
      task.dificuldade,
      // Outros parâmetros da classe Task que você possa precisar
    );
  }

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);
    return Scaffold(
      appBar: AppBar(
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
        title: const Text('Tarefas'),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView(
        padding: EdgeInsets.only(top: 8, bottom: 70),
        children: taskProvider.taskList.map((task) => buildTaskWidget(task)).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contextNew) => FormScreen(
                taskProvider: taskProvider,
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
