import 'package:flutter/material.dart';

class CreateRoutine extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CreateRoutineState();
}

class CreateRoutineState extends State<CreateRoutine> {
  String title = '';
  List<Widget> workouts = [];

  _addWorkout() {
    setState(() {
      workouts.add(Text('This is a workout'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'title',
            style: Theme.of(context).textTheme.headline,
          ),
        ),
        body: Container(
            child: CustomScrollView(slivers: <Widget>[
          SliverList(
              delegate: SliverChildListDelegate([
            Row(
              children: <Widget>[
                RaisedButton(
                  onPressed: _addWorkout,
                  color: Colors.green,
                  child: Row(
                    children: <Widget>[Icon(Icons.add), Text('Workout')],
                  ),
                ),
              ],
            )
          ])
          ),
              SliverList(
                delegate: SliverChildListDelegate([
                  ...workouts
                ]),
              )
        ])));
  }
}
