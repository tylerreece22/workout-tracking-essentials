import 'package:flutter/material.dart';
import 'package:workout_tracking_essentials/genericWidgets/AppDialog.dart';
import 'package:workout_tracking_essentials/model/Workout.dart';
import 'package:workout_tracking_essentials/model/WorkoutSet.dart';
import 'package:workout_tracking_essentials/workout/widgets/WorkoutColumnHeaders.dart';

import 'widgets/AddSetButton.dart';
import 'widgets/ShowSet.dart';

class RoutineWorkout extends StatefulWidget {
  Workout workout;

  RoutineWorkout(this.workout);

  @override
  State<StatefulWidget> createState() => RoutineWorkoutState(this.workout);
}

class RoutineWorkoutState extends State<RoutineWorkout> {
  Workout workout;
  List<Widget> sets = [];

  RoutineWorkoutState(this.workout);

  _addSet() {
    workout.sets.add(WorkoutSet(workout.sets.length + 1, '---', 100, 8));
    setState(() {
      sets.add(ShowSet(workout.sets[workout.sets.length - 1]));
    });
  }

  @override
  void initState() {
    sets = workout.sets.map((set) => ShowSet(set)).toList();
    super.initState();
  }

  _setWorkoutName(String newName) {
    setState(() {
      workout.name = newName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FlatButton(
          child: Text(
            workout.name.toUpperCase(),
            style: Theme.of(context).textTheme.subtitle,
          ),
          onPressed: () => showDialog(
              context: context,
              builder: (BuildContext context) {
                return AppDialog(_setWorkoutName, workout.name);
              }),
        ),
//        AppDialog(workout.name),
        WorkoutColumnHeaders(
          Text('Set'),
          Text('Previous'),
          Text('Weight'),
          Text('Reps'),
        ),
        ...sets,
        AddSetButton(_addSet)
      ],
    );
  }
}
