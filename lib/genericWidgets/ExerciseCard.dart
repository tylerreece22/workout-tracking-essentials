import 'package:flutter/material.dart';

class ExerciseCard extends StatelessWidget {
  final String title;
  final List<String> workouts;
  final IconData icon;

  const ExerciseCard({Key key, this.title, this.workouts, this.icon})
      : super(key: key);

  List<Widget> workoutList() {
    return workouts
        .map((workout) => new Row(
              children: <Widget>[
                Text(workout),
              ],
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(5.0),
        child: Container(
//            decoration: BoxDecoration(
//              boxShadow: [
//                BoxShadow(
//                    color: Colors.black, blurRadius: 5.0, spreadRadius: 1.0),
//              ],
//            ),
            child: Card(
              color: Theme.of(context).cardColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(top: 3.0, bottom: 3.0),
                          child: Text(title,
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold))),
                      Icon(icon),
                    ],
                  ),
                  ...workoutList()
                ],
              ),
            )));
  }
}
