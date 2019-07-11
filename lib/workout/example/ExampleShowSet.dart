import 'package:flutter/material.dart';
import 'package:workout_tracking_essentials/model/WorkoutSet.dart';

class ExampleShowSet extends StatelessWidget {
  WorkoutSet set;

  ExampleShowSet(this.set);

  Widget _textRowItem(String name) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(name),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: NeverScrollableScrollPhysics(),
      // Diables GridView scrolling
      shrinkWrap: true,
      //
      childAspectRatio: 2.0,
      primary: true,
      crossAxisCount: 4,
      children: <Widget>[
        _textRowItem(set.setNumber.toString()),
        _textRowItem(set.previous),
        _textRowItem(set.weight.toString()),
        _textRowItem(set.reps.toString()),
      ],
    );
  }
}
