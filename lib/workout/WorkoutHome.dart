import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:workout_tracking_essentials/exercise/CreateRoutine.dart';
import 'package:workout_tracking_essentials/exercise/RoutineCard.dart';
import 'package:workout_tracking_essentials/model/Routine.dart';
import 'package:workout_tracking_essentials/model/User.dart';

class WorkoutHome extends StatelessWidget {
  Routine routine;

  Future<List<Routine>> _getRoutines(context) async {
    String routineString =
        await DefaultAssetBundle.of(context).loadString('assets/routines.json');
    Map<String, dynamic> jsonMap = await json.decode(routineString);
    User user = User.fromJson(jsonMap);

    return user.routines;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: FutureBuilder(
        future: _getRoutines(context),
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
                            onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CreateRoutine())),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            color: Colors.green,
                          ))
                    ],
                  ),
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
