import 'dart:io';

import 'package:flutter/material.dart';
import 'package:workout_tracking_essentials/model/Routine.dart';
import 'package:workout_tracking_essentials/model/User.dart';
import 'package:workout_tracking_essentials/model/Workout.dart';
import 'package:workout_tracking_essentials/model/WorkoutSet.dart';

import 'package:workout_tracking_essentials/workout/RoutineWorkout.dart';
import 'widgets/AddWorkoutButton.dart';
import 'widgets/EditingBar.dart';
import 'package:workout_tracking_essentials/genericWidgets/AppDialog.dart';
import 'package:path_provider/path_provider.dart';

class CreateRoutine extends StatefulWidget {
  String routineName;
  User user;
  
  CreateRoutine(this.user, this.routineName);
  
  @override
  State<StatefulWidget> createState() => CreateRoutineState(user, routineName);
}

class CreateRoutineState extends State<CreateRoutine> {
  String routineName;
  User user;
  String newWorkoutName = '';
  List<Workout> workouts = [];

  List<Widget> workoutsToShow = [];
  
  CreateRoutineState(this.user, this.routineName);

  _setWorkoutName(String newName) {
      newWorkoutName = newName;
  }

  _addWorkout() async {
    await showDialog( context: context,
        builder: (BuildContext context) {
          return AppDialog(_setWorkoutName, 'Workout ${workouts.length + 1}', title: 'Workout Name:');
        });
    workouts.add(Workout(newWorkoutName, [WorkoutSet(1, '100x8', 100, 8)]));
    setState(() {
      workoutsToShow.add(RoutineWorkout(workouts[workouts.length - 1]));
    });
  }

  @override
  void initState() {
    workoutsToShow = workouts.map((set) => RoutineWorkout(set)).toList();
    super.initState();
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    print(directory);

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/myRoutines.json');
  }

  String _convertWorkoutsToString() {
    user.routines.add(Routine(routineName, workouts));
    String userString = user.toJson().toString();
    return userString;
  }

  Future<File> writeWorkouts() async {
    final file = await _localFile;
    print('Writing workouts locally!');

    // Write the file.
    return file.writeAsString(_convertWorkoutsToString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            routineName,
            style: Theme.of(context).textTheme.headline,
          ),
        ),
        body: ListView.builder(
            itemCount: 1,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  child: Column(
                children: <Widget>[
                  EditingBar('Create Routine', writeWorkouts),
                  ...workoutsToShow,
                  AddWorkoutButton(_addWorkout)
                ],
              ));
            }));
  }
}
