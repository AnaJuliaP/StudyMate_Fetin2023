import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:studymate_project_fetin/screens/pomodoro_screen.dart';
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
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.blue,
                  Colors.deepPurple,
                ])),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 100, left: 15),
                    child: Image.asset(
                      'assets/images/img_profile.png',
                      scale: 3.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 100, right: 15),
                    child: SvgPicture.asset(
                      'assets/images/img_notification.svg',
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 15,bottom: 15),
                child: Text('PÁGINA INICIAL',style: TextStyle(color: Colors.white),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Pomodoro()));
                  },
                  child: Row(
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        child: Image.asset('assets/images/img_rectangle9.png'),
                      ),
                      SizedBox(width: 10),
                      Text(
                        'CONTROLE DE PRODUTIVIDADE',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    minimumSize: Size(double.infinity, 100),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/InitialScreen');
                  },
                  child: Row(
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        child: Image.asset('assets/images/img_rectangle9_32x35.png'),
                      ),
                      SizedBox(width: 10),
                      Text(
                        'ATIVIDADES',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    minimumSize: Size(double.infinity, 100),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MenuReportScreen()));
                  },
                  child: Row(
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        child: Image.asset('assets/images/img_rectangle9_1.png'),
                      ),
                      SizedBox(width: 10),
                      Text(
                        'CONTROLE DE PRODUTIVIDADE',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    minimumSize: Size(double.infinity, 100),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
