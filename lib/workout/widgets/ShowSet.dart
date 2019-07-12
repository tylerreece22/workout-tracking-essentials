import 'package:flutter/material.dart';
import 'package:workout_tracking_essentials/model/WorkoutSet.dart';
import 'package:workout_tracking_essentials/workout/widgets/SetField.dart';

import 'CheckButton.dart';

class ShowSet extends StatelessWidget {
  WorkoutSet set;
  bool isWorkout;

  ShowSet(this.set, {this.isWorkout});

  Widget _textRowItem(String name) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(name),
      ],
    );
  }

  Widget _editableRowItem(String name) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SetField(name),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isWorkout == null) isWorkout = false;
    return GridView.count(
      physics: NeverScrollableScrollPhysics(),
      // Diables GridView scrolling
      shrinkWrap: true,
      //
      childAspectRatio: 2.0,
      primary: true,
      crossAxisCount: isWorkout ? 5 : 4,
      children: <Widget>[
        _textRowItem(set.setNumber.toString()),
        _textRowItem(set.previous),
        _editableRowItem(set.weight.toString()),
        _editableRowItem(set.reps.toString()),
        if (isWorkout) CheckButton()
      ],
    );
  }
}
