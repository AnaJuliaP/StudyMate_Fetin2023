import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:studymate_project_fetin/screens/menu_report_screen.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('StudyMate'),
        leading: SizedBox(
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
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(border: Border.all(width: 3)),
                    child: const Icon(Icons.photo_camera_front_outlined),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('luis.e@ges.inatel.br'),
                      Text('Level: '),
                      Text('Medals: '),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
                width: 300,
                height: 50,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text('WEEK PROGRESS'),
                    LinearPercentIndicator(
                      progressColor: Colors.deepPurple,
                      lineHeight: 20,
                      center: const Text('50%'),
                      percent: 0.5,
                    ),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Botão Calendário e to-do list
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: ElevatedButton(
                      onPressed: () {
                        // Lógica do botão
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side:
                              const BorderSide(width: 3.0, color: Colors.black),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0))),
                      child: const Icon(
                        Icons.calendar_month,
                        size: 50,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/InitialScreen');
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side:
                              const BorderSide(width: 3.0, color: Colors.black),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0))),
                      child: const Icon(
                        Icons.task,
                        size: 50,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Botão Tecnica pomodoro e comunidade
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => MenuReportScreen()));
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side:
                              const BorderSide(width: 3.0, color: Colors.black),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0))),
                      child: const Icon(
                        Icons.bolt,
                        size: 50,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side:
                              const BorderSide(width: 3.0, color: Colors.black),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0))),
                      child: const Icon(
                        Icons.people,
                        size: 50,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
