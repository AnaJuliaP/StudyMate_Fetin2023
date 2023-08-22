import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isButtonAnimating = false;
  double _buttonWidth = 305.0;

  @override
  void iniState(){
    super.initState();
    _isButtonAnimating = false;
  }
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset('assets/images/logoproj.jpg'),

                AnimatedContainer(
                  duration: Duration(seconds: 2),
                  width: _isButtonAnimating ? _buttonWidth : 305.0,
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(
                        Colors.deepPurple,
                      ),
                    ),
                    onPressed: () {
                      _animateButton(context);
                    },
                    child: const Text(
                      'Entrar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _animateButton(BuildContext context) {
    setState(() {
      _isButtonAnimating = true;
      _buttonWidth = 50.0;
    });

    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _isButtonAnimating = false;
      });
      Navigator.pushNamed(context, '/MenuScreen');
    });
  }
}