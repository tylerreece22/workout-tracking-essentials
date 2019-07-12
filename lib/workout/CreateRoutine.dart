import 'package:flutter/material.dart';
import 'package:workout_tracking_essentials/genericWidgets/BinaryAppDialog.dart';
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
  bool editable;

  CreateRoutine(this.routine, {this.editable});

  @override
  State<StatefulWidget> createState() =>
      CreateRoutineState(routine, editable: editable);
}

class CreateRoutineState extends State<CreateRoutine> {
  List<Widget> workoutsToShow = [];
  Routine routine;
  bool editable;

  CreateRoutineState(this.routine, {this.editable});

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
      print('adding workout ' + routine.workouts.toString());
      routine.workouts
          .add(Workout(widget.newWorkoutName, [WorkoutSet(1, '---', 100, 8)]));
      setState(() {
        workoutsToShow
            .add(RoutineWorkout(routine.workouts[routine.workouts.length - 1]));
      });
    }
  }

  @override
  void initState() {
    workoutsToShow =
        routine.workouts.map((set) => RoutineWorkout(set)).toList();
    if (editable == null) editable = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              routine.name,
              style: Theme.of(context).textTheme.headline,
            ),
            editable
                ? IconButton(
                    icon: Icon(Icons.delete_outline),
                    onPressed: () async {
                      bool yes = false;
                      await showDialog(
                          context: context,
                          builder: (context) {
                            return BinaryAppDialog(
                              'Are you sure you want to delete?',
                              () => {yes = true},
                            );
                          });
                      if (yes) {
                        await global.writer.deleteRoutine(routine.id);
                        Navigator.of(context).pop();
                      }
                    },
                  )
                : Container(),
          ],
        )),
        body: ListView.builder(
            itemCount: 1,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  child: Column(
                children: <Widget>[
                  EditingBar(
                      editable ? 'Edit Routine' : 'Create Routine',
                      editable
                          ? () => global.writer.updateRoutine(routine)
                          : () => global.writer.writeRoutine(routine)),
                  ...workoutsToShow,
                  AddWorkoutButton(_addWorkout)
                ],
              ));
            }));
  }
}
