import 'package:flutter/material.dart';
import 'package:workout_tracking_essentials/exercise/RoutineCardDetail.dart';
import 'package:workout_tracking_essentials/model/Routine.dart';

class RoutineCard extends StatefulWidget {
  Routine routine;

  RoutineCard(this.routine, {Key key});

  @override
  State<StatefulWidget> createState() => RoutineCardState(this.routine);
}

class RoutineCardState extends State<RoutineCard> {
  String title = "Exercise";
  Routine routine;

  RoutineCardState(this.routine);

  List<Widget> _workoutList() {
    setState(() {
      title = routine.name;
    });
    return routine.workouts
        .map(
          (workout) => Padding(
              padding: EdgeInsets.only(left: 10.0), child: Text(workout.name)),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(5.0),
        child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ExerciseCardDetail(
                          title: routine.name,
                          workouts: routine.workouts
                              .map(
                                (workout) => workout.name,
                              )
                              .toList())));
            },
            child: Container(
                child: Card(
              color: Theme.of(context).cardColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(top: 3.0, bottom: 3.0),
                          child: Text(title.length <= 13 ? title : title.substring(0, 11) + '...',
                              style: Theme.of(context).textTheme.subtitle
                          ),
                      ),
                    ],
                  ),
                  ..._workoutList(),
                  Row(
                    children: <Widget>[],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0, right: 8.0),
                    child: RaisedButton(
                        onPressed: () => {},
                        elevation: 10.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('Start Workout'),
                            Icon(Icons.fitness_center),
                          ],
                        )),
                  ),
                ],
              ),
            ))));
  }
}
