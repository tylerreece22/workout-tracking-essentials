import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:workout_tracking_essentials/workout/RoutineCard.dart';
import 'package:workout_tracking_essentials/model/Routine.dart';
import 'package:workout_tracking_essentials/model/User.dart';

class ExampleRoutines extends StatelessWidget {
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
    return FutureBuilder(
      future: _getExampleRoutines(context),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SliverGrid(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            delegate: SliverChildListDelegate([
              ...snapshot.data
                  .map<Widget>((routine) => RoutineCard(routine))
                  .toList(),
            ]),
          );
        } else if (snapshot.hasError) {
          return SliverList(
            delegate: SliverChildListDelegate([
              Text("${snapshot.error}"),
            ]),
          );
        }
        return SliverList(
          delegate: SliverChildListDelegate([
            CircularProgressIndicator(),
          ]),
        );
      },
    );
  }
}
