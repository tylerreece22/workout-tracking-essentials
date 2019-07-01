import 'package:flutter/material.dart';
import 'package:workout_tracking_essentials/exercise/CreateRoutine.dart';
import 'package:workout_tracking_essentials/exercise/RoutineCard.dart';

import 'MyRoutines.dart';

class WorkoutHome extends StatelessWidget {
  List<Widget> savedWorkouts = [];


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
                Padding(
                  padding: EdgeInsets.all(10.0),
                    child: RaisedButton(
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CreateRoutine())),
                      child: Icon(Icons.add, color: Colors.white,),
                      color: Colors.green,
                    )
                )
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
