import 'package:flutter/material.dart';
import 'package:workout_tracking_essentials/exercise/ExerciseCard.dart';

import 'MyRoutines.dart';

class WorkoutHome extends StatelessWidget {
  WorkoutHome({this.style}) : super();
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            'Workout',
                            style: Theme.of(context).textTheme.title,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        RaisedButton(
                          onPressed: () => print('I was tapped'),
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.add),
                              Text('Routine'),
                            ],
                          ),
                          color: Colors.lightGreen,
                        )
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Routines',
                    style: Theme.of(context).textTheme.subtitle,
                  ),
                ),
              ],
            ),
          ),
          MyRoutines(),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text('Example Routines',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
            ]),
          ),
          SliverGrid(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            delegate: SliverChildListDelegate([
              new ExerciseCard(
                title: "Monday",
                workouts: <String>[
                  'Barbell Curl',
                  'Pull ups',
                  'Dumbbell curls',
                  'Pull downs',
                  'Sit ups'
                ],
                icon: Icons.fitness_center,
              ),
              new ExerciseCard(
                title: "Tuesday",
                workouts: <String>[
                  'Barbell Curl',
                  'Pull ups',
                  'Dumbbell curls',
                  'Pull downs',
                  'Sit ups'
                ],
                icon: Icons.fitness_center,
              ),
              new ExerciseCard(
                title: "Wednesday",
                workouts: <String>[
                  'Barbell Curl',
                  'Pull ups',
                  'Dumbbell curls',
                  'Pull downs',
                  'Sit ups'
                ],
                icon: Icons.fitness_center,
              ),
            ]),
          ),
        ],
      ),
    ));
  }
}
