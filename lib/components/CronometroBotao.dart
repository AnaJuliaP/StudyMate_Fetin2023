import 'package:flutter/material.dart';

class CronometroBotao extends StatelessWidget {
  final String texto;
  final IconData icone;
  final void Function()? click;

  const CronometroBotao({
    Key? key,
    required this.texto,
    required this.icone,
    this.click,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        textStyle: TextStyle(
          fontSize: 25,
        ),
      ),
      onPressed: click,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(
              icone,
              size: 35,
            ),
          ),
          Text(texto,style: TextStyle(color: Colors.black),),
        ],
      ),
    );
  }
}
