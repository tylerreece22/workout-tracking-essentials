import 'package:flutter/material.dart';
import 'package:workout_tracking_essentials/genericWidgets/AppDialog.dart';
import 'package:workout_tracking_essentials/model/Routine.dart';
import 'package:workout_tracking_essentials/model/Workout.dart';
import 'package:workout_tracking_essentials/model/WorkoutSet.dart';

import 'package:workout_tracking_essentials/util/globals.dart' as global;
import 'RoutineWorkout.dart';
import 'widgets/AddWorkoutButton.dart';

class StartWorkout extends StatefulWidget {
  Routine routine;
  String newWorkoutName;

  StartWorkout(this.routine);

  @override
  State<StatefulWidget> createState() => StartWorkoutState(routine);
}

class StartWorkoutState extends State<StartWorkout> {
  List<Widget> workoutsToShow = [];
  Routine routine;
  Stopwatch _stopwatch = Stopwatch();
  String time;

  StartWorkoutState(this.routine);

  @override
  void initState() {
    workoutsToShow =
        routine.workouts.map((set) => RoutineWorkout(set, isWorkout: true,)).toList();
    time = _stopwatch.elapsedMilliseconds.toString();
    _stopwatch.start();
    super.initState();
  }

  _setWorkoutName(String newName) {
    widget.newWorkoutName = newName;
  }

  _addWorkout() async {
    bool xPressed = false;
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AppDialog(
              _setWorkoutName, 'Workout ${routine.workouts.length + 1}',
              setXPressed: () => {xPressed = true}, title: 'Workout Name:');
        });
    if (!xPressed) {
      routine.workouts
          .add(Workout(widget.newWorkoutName, [WorkoutSet(1, '---', 100, 8)]));
      setState(() {
        workoutsToShow
            .add(RoutineWorkout(routine.workouts[routine.workouts.length - 1], isWorkout: true,));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            routine.name,
            style: Theme.of(context).textTheme.headline,
          ),
        ),
        body: ListView.builder(
            itemCount: 1,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  child: Column(
                children: <Widget>[
                  Text(time),
                  ...workoutsToShow,
                  AddWorkoutButton(_addWorkout),
                ],
              ));
            }));
  }
}
