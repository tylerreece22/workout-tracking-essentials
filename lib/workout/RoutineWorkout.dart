import 'package:flutter/material.dart';
import 'package:workout_tracking_essentials/genericWidgets/AppDialog.dart';
import 'package:workout_tracking_essentials/model/Workout.dart';
import 'package:workout_tracking_essentials/model/WorkoutSet.dart';
import 'package:workout_tracking_essentials/workout/widgets/AddSubtractButton.dart';
import 'package:workout_tracking_essentials/workout/widgets/WorkoutColumnHeaders.dart';

import 'widgets/CheckButton.dart';
import 'widgets/ShowSet.dart';

class RoutineWorkout extends StatefulWidget {
  Workout workout;
  bool isWorkout;

  RoutineWorkout(this.workout, {this.isWorkout});

  @override
  State<StatefulWidget> createState() => RoutineWorkoutState(workout, isWorkout);
}

class RoutineWorkoutState extends State<RoutineWorkout> {
  Workout workout;
  List<Widget> sets = [];
  bool isWorkout;

  RoutineWorkoutState(this.workout, this.isWorkout);

  _addSet() {
    workout.sets.add(WorkoutSet(workout.sets.length + 1, '---', 100, 8));
    setState(() {
      sets.add(ShowSet(workout.sets[workout.sets.length - 1], isWorkout: isWorkout,));
    });
  }

  _removeSet() {
    if (sets.isNotEmpty && workout.sets.isNotEmpty) {
      workout.sets.removeLast();
      setState(() {
        sets.removeLast();
      });
    }
  }

  @override
  void initState() {
    sets = workout.sets.map((set) => ShowSet(set, isWorkout: isWorkout,)).toList();
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
        WorkoutColumnHeaders(
          Text('Set'),
          Text('Previous'),
          Text('Weight'),
          Text('Reps'),
        ),
        ...sets,
        ButtonBar(
          alignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            AddSubtractButton(true, _addSet),
            AddSubtractButton(false, _removeSet),
          ],
        ),
      ],
    );
  }
}
