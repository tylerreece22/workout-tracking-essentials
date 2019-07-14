import 'package:flutter/material.dart';
import 'package:workout_tracking_essentials/genericWidgets/BinaryAppDialog.dart';
import 'package:workout_tracking_essentials/model/Routine.dart';
import 'package:workout_tracking_essentials/util/globals.dart' as global;

import 'widgets/EditingBar.dart';
import 'widgets/WorkoutList.dart';

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

  @override
  void initState() {
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
                  WorkoutList(routine),
                ],
              ));
            }));
  }
}
