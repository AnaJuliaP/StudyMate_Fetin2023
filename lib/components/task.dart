import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studymate_project_fetin/data/task_provider.dart';
import 'congratulations_dialog.dart';
import 'difficulty.dart';
import '../data/completed_task_provider.dart';
import '../models/task_model.dart';




class TaskComponent extends StatefulWidget {

  final String nome;
  final String foto;
  final int dificuldade;
  bool concluida;
  DateTime? dataConclusao;

  TaskComponent(

    this.nome,
    this.foto,
    this.dificuldade, {
    Key? key,
    this.concluida = false, // Valor padrão para a nova propriedade
  }) : super(key: key);

  int nivel = 0;

  BuildContext? get taskContext => null;



  @override
  State<TaskComponent> createState() => _TaskComponentState();
}

class _TaskComponentState extends State<TaskComponent> {
  bool assetOrNetwork() {
    if (widget.foto.contains('http')) {
      return false;
    }
    return true;
  }

  void _increaseLevel() {
    setState(() {
      widget.nivel++;

      if (widget.nivel >= widget.dificuldade * 10) {
        if (widget.nivel >= widget.dificuldade) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return CongratulationsDialog(taskName: widget.nome);
            },
          );

          final completedTaskProvider = Provider.of<CompletedTaskProvider>(
            context,
            listen: false,
          );

          TaskModel taskModel = TaskModel(
            id: 0, // Defina o ID corretamente
            name: widget.nome,
            difficulty: widget.dificuldade,
          );

          completedTaskProvider.addCompletedTask(taskModel);


        }

        widget.nivel = 1;

        final taskProvider = Provider.of<TaskProvider>(
          context,
          listen: false,
        );

        taskProvider.removeTask(
          widget.nome,
          widget.foto,
          widget.dificuldade,
        );
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.deepPurple),
            height: 140,
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.white,
                ),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.black26,
                      ),
                      width: 72,
                      height: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: assetOrNetwork()
                            ? Image.asset(
                                widget.foto,
                                fit: BoxFit.cover,
                              )
                            : Image.network(
                                widget.foto,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 200,
                          child: Text(
                            widget.nome,
                            style: TextStyle(
                              fontSize: 24,
                              overflow: TextOverflow.ellipsis,
                              decoration: widget
                                      .concluida // Adicione esta linha
                                  ? TextDecoration
                                      .lineThrough // Texto com linha atravessada se a tarefa estiver concluída
                                  : TextDecoration.none,
                            ),
                          ),
                        ),
                        Difficulty(
                          dificultyLevel: widget.dificuldade,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              final taskProvider = Provider.of<TaskProvider>(
                                context,
                                listen: false,
                              );
                              taskProvider.removeTask(
                                widget.nome,
                                widget.foto,
                                widget.dificuldade,
                              );
                            },
                            child: Icon(Icons.delete),
                          ),
                          ElevatedButton(
                            onPressed: _increaseLevel,
                            child: Icon(Icons.arrow_drop_up_rounded),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: SizedBox(
                      width: 200,
                      child: LinearProgressIndicator(
                        color: Colors.white,
                        value: (widget.dificuldade > 0)
                            ? (widget.nivel / widget.dificuldade) / 10
                            : 1,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      'Nivel: ${widget.nivel}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        decoration: widget.concluida // Adicione esta linha
                            ? TextDecoration
                                .lineThrough // Texto com linha atravessada se a tarefa estiver concluída
                            : TextDecoration.none,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
