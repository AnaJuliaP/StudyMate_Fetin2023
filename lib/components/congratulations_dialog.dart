import 'package:flutter/material.dart';

class CongratulationsDialog extends StatelessWidget {
  final String taskName;

  CongratulationsDialog({required this.taskName});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.star,
              color: Colors.yellowAccent,
              size: 48,
            ),
            SizedBox(height: 16),
            Text(
              'Parabéns!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Você concluiu a tarefa:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              taskName,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Fecha o diálogo
              },
              child: Text('Ok'),
            ),
          ],
        ),
      ),
    );
  }
}
