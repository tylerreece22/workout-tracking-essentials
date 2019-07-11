import 'package:flutter/material.dart';
import 'package:workout_tracking_essentials/model/Routine.dart';

import 'package:workout_tracking_essentials/workout/example/ExampleRoutineWorkout.dart';

class ExampleCardDetail extends StatefulWidget {
  Routine routine;
  List<Widget> workoutsToShow = [];

  ExampleCardDetail(this.routine);

  @override
  State<StatefulWidget> createState() =>  ExampleCardDetailState();
}

class ExampleCardDetailState extends State<ExampleCardDetail> {

  @override
  void initState() {
    widget.workoutsToShow = widget.routine.workouts.map((set) => ExampleRoutineWorkout(set)).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.routine.name,
            style: Theme.of(context).textTheme.headline,
          ),
        ),
        body: ListView.builder(
            itemCount: 1,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  child: Column(
                    children: <Widget>[
                      ...widget.workoutsToShow,
                    ],
                  ));
            }));
  }
}
