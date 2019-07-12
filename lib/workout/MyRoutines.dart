import 'package:flutter/material.dart';
import 'package:workout_tracking_essentials/workout/RoutineCard.dart';
import 'package:workout_tracking_essentials/model/User.dart';

class MyRoutines extends StatelessWidget {
  User user;

  MyRoutines(this.user);

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      delegate: SliverChildListDelegate([
        ...user.routines
            .map<Widget>((routine) => RoutineCard(routine))
            .toList(),
      ]),
    );
  }
}
