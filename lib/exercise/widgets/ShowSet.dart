import 'package:flutter/material.dart';
import 'package:workout_tracking_essentials/exercise/widgets/SetField.dart';
import 'package:workout_tracking_essentials/model/WorkoutSet.dart';

class ShowSet extends StatelessWidget {
  WorkoutSet set;

  ShowSet(this.set);

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
        _editableRowItem(set.weight.toString()),
        _editableRowItem(set.reps.toString()),
      ],
    );
  }
}
