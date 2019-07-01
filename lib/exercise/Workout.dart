import 'package:flutter/material.dart';
import 'package:workout_tracking_essentials/genericWidgets/AppDialog.dart';

import 'widgets/AddSetButton.dart';
import 'widgets/CheckButton.dart';
import 'widgets/SetField.dart';
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
      sets.add(WorkoutRow(
          Text(
            '${sets.length + 1}',
            style: Theme.of(context).textTheme.body2,
          ),
          Text(
            '100x99',
            style: Theme.of(context).textTheme.body2,
          ),
          SetField(
            '100'
          ),
          SetField(
            '6',
          ),
          CheckButton()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AppDialog(workoutName),
        WorkoutRow(
            Text('Set'),
            Text('Previous'),
            Text('Weight'),
            Text('Reps'),
            Text('Done')),
        ...sets,
        AddSetButton(_addSet)
      ],
    );
  }
}
