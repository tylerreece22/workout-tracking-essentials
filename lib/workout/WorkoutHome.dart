import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:workout_tracking_essentials/exercise/CreateRoutine.dart';
import 'package:workout_tracking_essentials/exercise/RoutineCard.dart';
import 'package:workout_tracking_essentials/genericWidgets/AppDialog.dart';
import 'package:workout_tracking_essentials/model/Routine.dart';
import 'package:workout_tracking_essentials/model/User.dart';

import 'MyRoutines.dart';

class WorkoutHome extends StatelessWidget {
  User user;

  Future<List<Routine>> _getExampleRoutines(context) async {
    String routineString =
        await DefaultAssetBundle.of(context).loadString('assets/routines.json');
    Map<String, dynamic> jsonMap = await json.decode(routineString);
    user = User.fromJson(jsonMap);

    return user.routines;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: FutureBuilder(
        future: _getExampleRoutines(context),
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
                            await showDialog(
                                context: context,
                                builder: (context) {
                                  return AppDialog(
                                    (newName) => {routineName = newName},
                                    routineName,
                                    title: 'Routine Name:',
                                  );
                                });
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CreateRoutine(user, routineName)));
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
                SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  delegate: SliverChildListDelegate([
                    ...snapshot.data
                        .map<Widget>((routine) => RoutineCard(routine))
                        .toList()
                  ]),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return CircularProgressIndicator();
        },
      ),
    ));
  }
}
