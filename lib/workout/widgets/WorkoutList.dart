import 'package:flutter/material.dart';
import 'package:workout_tracking_essentials/genericWidgets/AppDialog.dart';
import 'package:workout_tracking_essentials/model/Routine.dart';
import 'package:workout_tracking_essentials/model/Workout.dart';
import 'package:workout_tracking_essentials/model/WorkoutSet.dart';

import '../RoutineWorkout.dart';
import 'AddSubtractButton.dart';

class WorkoutList extends StatefulWidget {
  String newWorkoutName = '';
  Routine routine;
  bool isWorkout;

  WorkoutList(this.routine, {this.isWorkout});

  @override
  State<StatefulWidget> createState() => WorkoutListState(routine);
}

class WorkoutListState extends State<WorkoutList> {
  Routine routine;
  List<Widget> workoutsToShow = [];

  WorkoutListState(this.routine);

  _removeWorkout() {
    if (routine.workouts.isNotEmpty && workoutsToShow.isNotEmpty) {
      routine.workouts.removeLast();
      setState(() {
        workoutsToShow.removeLast();
      });
    }
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
      if (widget.isWorkout != null) {
        routine.workouts.add(Workout(widget.newWorkoutName,
            [WorkoutSet.withDone(1, '---', 100, 8, false)]));
        setState(() {
          workoutsToShow.add(RoutineWorkout(
            routine.workouts[routine.workouts.length - 1],
            isWorkout: true,
          ));
        });
      } else {
        routine.workouts.add(
            Workout(widget.newWorkoutName, [WorkoutSet(1, '---', 100, 8)]));
        setState(() {
          workoutsToShow.add(
              RoutineWorkout(routine.workouts[routine.workouts.length - 1]));
        });
      }
    }
  }

  @override
  void initState() {
    workoutsToShow = widget.isWorkout != null
        ? routine.workouts
            .map((set) => RoutineWorkout(
                  set,
                  isWorkout: true,
                ))
            .toList()
        : routine.workouts.map((set) => RoutineWorkout(set)).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ...workoutsToShow,
        ButtonBar(
          alignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            AddSubtractButton(
              true,
              'Workout',
              _addWorkout,
              isMax: true,
            ),
            AddSubtractButton(
              false,
              'Workout',
              _removeWorkout,
              isMax: true,
            )
          ],
        )
      ],
    );
  }
}
