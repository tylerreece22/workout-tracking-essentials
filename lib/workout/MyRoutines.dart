import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:workout_tracking_essentials/exercise/RoutineCard.dart';
import 'package:workout_tracking_essentials/model/Routine.dart';
import 'package:workout_tracking_essentials/model/User.dart';

class MyRoutines extends StatelessWidget {

  Future<List<Routine>> _getRoutines(context) async {
    String routineString = await DefaultAssetBundle.of(context).loadString(
        'assets/routines.json');
    Map<String, dynamic> jsonMap = await json.decode(routineString);
    User user = User.fromJson(jsonMap);

    return user.routines;
  }

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate:
      SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      delegate: SliverChildListDelegate([
        FutureBuilder(
          future: _getRoutines(context),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return snapshot.data.map<Widget>((routine) => RoutineCard(routine)).toList();
            } else if (snapshot.hasError) {
              print(snapshot.error);
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          },
        ),
      ]),
    );
  }
}
