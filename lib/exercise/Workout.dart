import 'package:flutter/material.dart';

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

  Widget _workoutName() {
    return Text(
      workoutName.toUpperCase(),
      style: Theme.of(context).textTheme.subtitle,
    );
  }

  Widget _addSet() {
    setState(() {
      sets.add(WorkoutRow('${sets.length + 1}', '100 x 6', '100', '6', 'true'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _workoutName(),
        WorkoutRow('Set', 'Previous', 'Weight', 'Reps', 'Done'),
        ...sets,
        AddSetButton(_addSet)
      ],
    );
  }
}
