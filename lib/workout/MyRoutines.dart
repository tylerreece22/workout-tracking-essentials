import 'package:flutter/material.dart';
import 'package:workout_tracking_essentials/model/User.dart';
import 'package:workout_tracking_essentials/util/globals.dart' as globals;
import 'package:workout_tracking_essentials/workout/RoutineCard.dart';

class MyRoutines extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: globals.getUser(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          User user = snapshot.data;
          return SliverGrid(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            delegate: SliverChildListDelegate([
              ...user.routines
                  .map<Widget>((routine) => RoutineCard(routine))
                  .toList()
            ]),
          );
        } else if (snapshot.hasError) {
          print('snapshot error: ${snapshot.error}');
          return SliverList(
            delegate: SliverChildListDelegate(
                [Text('snapshot error: ${snapshot.error}')]),
          );
        }
        return SliverList(
          delegate: SliverChildListDelegate([CircularProgressIndicator()]),
        );
      },
    );
  }
}
