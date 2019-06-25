import 'package:flutter/material.dart';

class ExerciseCardDetail extends StatelessWidget {
  final String title;
  final List<String> workouts;

  const ExerciseCardDetail({this.title, this.workouts});

  List<Widget> _getWorkouts(BuildContext context) {
    return workouts
        .map((workout) => new Row(
      children: <Widget>[
        Padding(
            padding: EdgeInsets.only(left: 10.0), child: Text(workout, style: Theme.of(context).textTheme.body1,)),
      ],
    )).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: Theme.of(context).primaryTextTheme.headline,),
      ),
      body: Column(
          children: <Widget>[
            ...this._getWorkouts(context),
            RaisedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Back'),
            )
          ],
        ),
    );
  }
}
