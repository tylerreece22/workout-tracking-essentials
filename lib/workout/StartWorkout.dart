import 'package:flutter/material.dart';
import 'package:workout_tracking_essentials/model/Routine.dart';
import 'package:workout_tracking_essentials/util/TimerText.dart';

import 'widgets/WorkoutList.dart';

class StartWorkout extends StatefulWidget {
  Routine routine;
  String newWorkoutName;

  StartWorkout(this.routine);

  @override
  State<StatefulWidget> createState() => StartWorkoutState(routine);
}

class StartWorkoutState extends State<StartWorkout> {
  List<Widget> workoutsToShow = [];
  Routine routine;
  Stopwatch _stopwatch = Stopwatch();
  String time;

  StartWorkoutState(this.routine);

  @override
  void initState() {
    time = _stopwatch.elapsedMilliseconds.toString();
    _stopwatch.start();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.amber,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                TimerText(
                  stopwatch: _stopwatch,
                ),
                RaisedButton(
                  color: Colors.green,
                  textColor: Colors.white,
                  onPressed: () {},
                  child: Text('Finished'),
                ),
              ],
            )),
        body: ListView.builder(
            itemCount: 1,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  child: Column(
                children: <Widget>[
                  Text(
                    routine.name,
                    overflow: TextOverflow.clip,
                    style: Theme.of(context).textTheme.title,
                  ),
                  Divider(),
                  WorkoutList(
                    routine,
                    isWorkout: true,
                  ),
                ],
              ));
            }));
  }
}
