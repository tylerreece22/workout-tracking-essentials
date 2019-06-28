import 'package:flutter/material.dart';
import 'package:workout_tracking_essentials/genericWidgets/AppDialog.dart';

import 'widgets/AddSetButton.dart';
import 'widgets/WorkoutRow.dart';

class Workout extends StatefulWidget {
  String workoutName;

  Workout({this.workoutName});

  @override
  State<StatefulWidget> createState() => WorkoutState(workoutName: workoutName);
}

class WorkoutState extends State<Workout> {
  String workoutName;
  List<Widget> sets = [];

  WorkoutState({this.workoutName});

  Widget _addSet() {
    setState(() {
      sets.add(WorkoutRow('${sets.length + 1}', '100 x 6', '100', '6', 'true'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
      AppDialog(workoutName),
        WorkoutRow('Set', 'Previous', 'Weight', 'Reps', 'Done'),
        ...sets,
        AddSetButton(_addSet)
      ],
    );
  }
}
