import 'package:flutter/material.dart';
import 'package:workout_tracking_essentials/model/Workout.dart';
import 'package:workout_tracking_essentials/workout/widgets/WorkoutColumnHeaders.dart';

import 'ExampleShowSet.dart';

class ExampleRoutineWorkout extends StatefulWidget {
  Workout workout;

  ExampleRoutineWorkout(this.workout);

  @override
  State<StatefulWidget> createState() =>
      ExampleRoutineWorkoutState(this.workout);
}

class ExampleRoutineWorkoutState extends State<ExampleRoutineWorkout> {
  Workout workout;
  List<Widget> sets = [];

  ExampleRoutineWorkoutState(this.workout);

  @override
  void initState() {
    sets = workout.sets.map((set) => ExampleShowSet(set)).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          workout.name.toUpperCase(),
          style: Theme.of(context).textTheme.subtitle,
        ),
        WorkoutColumnHeaders(
          Text('Set'),
          Text('Previous'),
          Text('Weight'),
          Text('Reps'),
        ),
        ...sets,
      ],
    );
  }
}
