import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:workout_tracking_essentials/model/Routine.dart';
import 'package:workout_tracking_essentials/model/Workout.dart';
import 'package:workout_tracking_essentials/model/WorkoutSet.dart';
import 'package:workout_tracking_essentials/util/AppFileWriter.dart';
import 'package:workout_tracking_essentials/workout/CreateRoutine.dart';
import 'package:workout_tracking_essentials/workout/example/ExampleRoutines.dart';
import 'package:workout_tracking_essentials/genericWidgets/AppDialog.dart';
import 'package:workout_tracking_essentials/model/User.dart';

import 'MyRoutines.dart';

class WorkoutHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => WorkoutHomeState();
}

class WorkoutHomeState extends State<WorkoutHome> {
  //TODO: Update this instance of user across Widgets?
  User user;
  AppFileWriter writer = new AppFileWriter();

  Future<User> _getUser() async {
    String userString = await writer.readUser();
    Map<String, dynamic> jsonMap = await json.decode(userString);
    user = User.fromJson(jsonMap);
    return user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder(
          future: _getUser(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return CustomScrollView(
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
                                      setXPressed : () => {xPressed = true},
                                      title: 'Routine Name:',
                                    );
                                  });
                              if (!xPressed)
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CreateRoutine(
                                            Routine(
                                                routineName, <Workout>[Workout('Workout 1', <WorkoutSet>[WorkoutSet(1, '---', 100, 8)])]))));
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
                  MyRoutines(snapshot.data),
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
              );
            } else if (snapshot.hasError) {
              print('snapshot: ' + snapshot.error.toString());
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
