import 'package:flutter/material.dart';
import 'package:workout_tracking_essentials/genericWidgets/BinaryAppDialog.dart';
import 'package:workout_tracking_essentials/model/Routine.dart';
import 'package:workout_tracking_essentials/model/User.dart';
import 'package:workout_tracking_essentials/util/globals.dart' as global;

import 'widgets/EditingBar.dart';
import 'widgets/WorkoutList.dart';

class CreateRoutine extends StatefulWidget {
  String newWorkoutName = '';
  bool editable;
  String routineId;

  CreateRoutine({this.routineId, this.editable});

  @override
  State<StatefulWidget> createState() =>
      CreateRoutineState(routineId: routineId, editable: editable);
}

class CreateRoutineState extends State<CreateRoutine> {
  List<Widget> workoutsToShow = [];
  bool editable;
  String routineId;

  CreateRoutineState({this.routineId, this.editable});

  @override
  void initState() {
    if (editable == null) editable = false;
    super.initState();
  }

  Future<Routine> _getRoutine() async {
    if (routineId != null) {
      return await global.getRoutine(routineId);
    } else {
      User user = await global.getUser();
      return user.routines[user.routines.length - 1];
    }
  }

  @override
  Widget build(BuildContext context) {
    print('routineId: $routineId');
    return FutureBuilder(
      future: _getRoutine(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Routine routine = snapshot.data;
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
                        EditingBar(editable ? 'Edit Routine' : 'Create Routine',
                            () => global.writer.updateRoutine(routine)),
                        WorkoutList(routine),
                      ],
                    ));
                  }));
        } else if (snapshot.hasError) {
          print('snapshot: ' + snapshot.error.toString());
          return Text("${snapshot.error}");
        }
        return CircularProgressIndicator();
      },
    );
  }
}
