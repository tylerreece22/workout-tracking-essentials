import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:workout_tracking_essentials/exercise/CreateRoutine.dart';
import 'package:workout_tracking_essentials/exercise/RoutineCard.dart';
import 'package:workout_tracking_essentials/model/Routine.dart';

import 'MyRoutines.dart';

class WorkoutHome extends StatelessWidget {
  Routine routine;

  Future<Routine> _getRoutine(context) async {
    final routineString = await DefaultAssetBundle.of(context)
        .loadString('assets/routines.json');
    final map = json.decode(routineString);
    Routine loadedRoutine = Routine.fromJson(map);

    return loadedRoutine;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      children: <Widget>[
                      ],
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
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CreateRoutine())),
                      child: Icon(Icons.add, color: Colors.white,),
                      color: Colors.green,
                    )
                )
              ],
            ),
          ),
          MyRoutines(),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text('Example Routines',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
            ]),
          ),
//          SliverGrid(
//            gridDelegate:
//                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//            delegate: SliverChildListDelegate([
//              FutureBuilder(
//                future: _getRoutine(context),
//                builder: (context, snapshot) {
//                if (snapshot.hasData) { //checks if the response returns valid data
//                  return RoutineCard(snapshot.data);
//                } else if (snapshot.hasError) { //checks if the response throws an error
//                  return Text("${snapshot.error}");
//                }
//                return CircularProgressIndicator();
//              },),
//            ]),
//          ),
        ],
      ),
    ));
  }
}
