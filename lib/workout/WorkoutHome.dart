import 'package:flutter/material.dart';
import 'package:workout_tracking_essentials/genericWidgets/AppDialog.dart';
import 'package:workout_tracking_essentials/model/Routine.dart';
import 'package:workout_tracking_essentials/model/Workout.dart';
import 'package:workout_tracking_essentials/util/UserManager.dart';
import 'package:workout_tracking_essentials/util/UserProvider.dart';
import 'package:workout_tracking_essentials/util/globals.dart' as globals;
import 'package:workout_tracking_essentials/workout/CreateRoutine.dart';
import 'package:workout_tracking_essentials/workout/example/ExampleRoutines.dart';

import 'MyRoutines.dart';

class WorkoutHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => WorkoutHomeState();
}

class WorkoutHomeState extends State<WorkoutHome> {
  @override
  Widget build(BuildContext context) {
    return UserProvider(
        data: UserManager(),
        child: Scaffold(
          body: Container(
              child: CustomScrollView(
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                'Workout',
                                style: Theme.of(context).textTheme.title,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[],
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'Routines',
                        style: Theme.of(context).textTheme.subtitle,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: RaisedButton(
                        onPressed: () async {
                          String routineName = 'New Routine';
                          bool xPressed = false;
                          await showDialog(
                              context: context,
                              builder: (context) {
                                return AppDialog(
                                  (newName) => {routineName = newName},
                                  routineName,
                                  setXPressed: () => {xPressed = true},
                                  title: 'Routine Name:',
                                );
                              });
                          if (!xPressed)
                            // Awaiting writing the new routine to be picked up by next component
                            // todo: fix double routine creation
                            await globals.writer.writeRoutine(
                                Routine(routineName, <Workout>[]));
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CreateRoutine()));
                        },
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        color: Colors.green,
                      ),
                    )
                  ],
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text('My Routines',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                ]),
              ),
              MyRoutines(),
              SliverList(
                delegate: SliverChildListDelegate([
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text('Example Routines',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                ]),
              ),
              ExampleRoutines(),
            ],
          )),
        ));
  }
}
