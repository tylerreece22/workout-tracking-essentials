import 'package:flutter/material.dart';
import 'package:workout_tracking_essentials/model/Routine.dart';
import 'package:workout_tracking_essentials/model/Workout.dart';
import 'package:workout_tracking_essentials/model/WorkoutSet.dart';

import 'package:workout_tracking_essentials/workout/RoutineWorkout.dart';
import 'widgets/AddWorkoutButton.dart';
import 'widgets/EditingBar.dart';
import 'package:workout_tracking_essentials/genericWidgets/AppDialog.dart';
import 'package:workout_tracking_essentials/util/globals.dart' as global;

class CreateRoutine extends StatefulWidget {
  String newWorkoutName = '';
  Routine routine;

  CreateRoutine(this.routine);

  @override
  State<StatefulWidget> createState() => CreateRoutineState();
}

class CreateRoutineState extends State<CreateRoutine> {
  List<Widget> workoutsToShow = [];

  _setWorkoutName(String newName) {
    widget.newWorkoutName = newName;
  }

  _addWorkout() async {
    bool xPressed = false;
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AppDialog(
              _setWorkoutName, 'Workout ${widget.routine.workouts.length + 1}',
              setXPressed: () => {xPressed = true}, title: 'Workout Name:');
        });
    if (!xPressed) {
      widget.routine.workouts.add(
          Workout(widget.newWorkoutName, [WorkoutSet(1, '100x8', 100, 8)]));
      setState(() {
        workoutsToShow
            .add(RoutineWorkout(widget.routine.workouts[widget.routine.workouts.length - 1]));
      });
    }
  }

  _writeNewRoutine() {
    global.writer.writeRoutine(widget.routine);
  }

  @override
  void initState() {
    workoutsToShow = widget.routine.workouts.map((set) => RoutineWorkout(set)).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.routine.name,
            style: Theme.of(context).textTheme.headline,
          ),
        ),
        body: ListView.builder(
            itemCount: 1,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  child: Column(
                children: <Widget>[
                  EditingBar('Create Routine', _writeNewRoutine),
                  ...workoutsToShow,
                  AddWorkoutButton(_addWorkout)
                ],
              ));
            }));
  }
}
