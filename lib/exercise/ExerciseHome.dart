import 'package:flutter/material.dart';

class ExerciseHome extends StatelessWidget {
  ExerciseHome({this.style}) : super();
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Center(
            child: Text('Exercise', style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold)),
          )
    );
  }
}
