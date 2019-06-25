import 'package:flutter/material.dart';

import 'Workout.dart';

class CreateRoutine extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CreateRoutineState();
}

class CreateRoutineState extends State<CreateRoutine> {
  String title = '';
  List<Widget> workouts = [];

  _addWorkout() {
    Workout workout = new Workout();
    setState(() {
      workouts.insertAll(workouts.length, workout.buildWorkoutSets());
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            title,
            style: Theme.of(context).textTheme.headline,
          ),
        ),
        body: Container(
            child: CustomScrollView(slivers: <Widget>[
          SliverGrid(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
            delegate: SliverChildListDelegate([
              Text('Set'),
              Text('Previous'),
              Text('lbs'),
              Text('Reps'),
              Icon(Icons.check),
              ...workouts
            ]),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: RaisedButton(
                    onPressed: _addWorkout,
                    color: Colors.green,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        Text(
                          'Exercise',
                          style: Theme.of(context).textTheme.button,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          ])),
        ])));
  }
}
