import 'dart:io';

import 'package:flutter/material.dart';
import 'package:workout_tracking_essentials/model/Workout.dart';
import 'package:workout_tracking_essentials/model/WorkoutSet.dart';

import 'RoutineWorkout.dart';
import 'widgets/AddWorkoutButton.dart';
import 'widgets/EditingBar.dart';
import 'package:path_provider/path_provider.dart';

class CreateRoutine extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CreateRoutineState();
}

class CreateRoutineState extends State<CreateRoutine> {
  String routineTitle = 'New Routine';
  List<Workout> workouts = [
    Workout('Workout 1', [WorkoutSet(1, '100x8', 100, 8)])
  ];

  List<Widget> workoutsToShow = [];

  _addWorkout() {
    workouts.add(Workout('Workout ${workouts.length + 1}', [WorkoutSet(1, '100x8', 100, 8)]));
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
    String workoutString = '';
    workouts.forEach((workout) => workoutString += workout.toJson().toString());
    return workoutString;
  }

  Future<File> writeWorkouts() async {
    final file = await _localFile;
    print('Writing workouts locally!');

    // Write the file.
    return file.writeAsString(_convertWorkoutsToString());
  }

  Future<String> readWorkouts() async {
    try {
      final file = await _localFile;

      // Read the file.
      String contents = await file.readAsString();
      print('contents of local file: ' + contents);
      return contents;
    } catch (e) {
      return '${e}';
    }
  }

  @override
  Widget build(BuildContext context) {
    readWorkouts();
    return Scaffold(
        appBar: AppBar(
          title: Text(
            routineTitle,
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
                  AddWorkoutButton(addWorkout: _addWorkout)
                ],
              ));
            }));
  }
}
