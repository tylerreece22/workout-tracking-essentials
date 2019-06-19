import 'package:flutter/material.dart';

class ExerciseCard extends StatelessWidget {
  final String title;
  final List<String> workouts;
  final Icon icon;

  const ExerciseCard({Key key, this.title, this.workouts, this.icon})
      : super(key: key);

  List<Widget> workoutList() {
    return workouts.map((workout) => new Row(
      children: <Widget>[
        Text(workout),
      ],
    )).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(title,
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold)),
                  Icon(Icons.fitness_center),
                ],
              ),
            ...workoutList()
            ],
          ),
        );
  }
}
