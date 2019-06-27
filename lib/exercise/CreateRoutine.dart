import 'package:flutter/material.dart';

import 'Workout.dart';
import 'widgets/AddWorkoutButton.dart';

class CreateRoutine extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CreateRoutineState();
}

class CreateRoutineState extends State<CreateRoutine> {
  String routineTitle = 'New Routine';
  List<Widget> workouts = [
    new Workout(
      workoutName: 'Example Workout',
    )
  ];

  _addWorkout() {
    Workout workout = new Workout(workoutName: 'cool workout');
    setState(() {
      workouts.add(workout);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            routineTitle,
            style: Theme.of(context).textTheme.headline,
          ),
        ),
        body: ListView.builder(
            itemCount: 1,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  child: Column(
                children: <Widget>[
                  ...workouts,
                  AddWorkoutButton(addWorkout: _addWorkout)
                ],
              ));
            }));
  }
}
