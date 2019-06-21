import 'package:flutter/material.dart';
import 'package:workout_tracking_essentials/genericWidgets/ExerciseCard.dart';

class WorkoutHome extends StatelessWidget {
  WorkoutHome({this.style}) : super();
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//        backgroundColor: Theme.of(context).backgroundColor,
        body: Container(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Text(
                  'Start Workout',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Text(
                    'Quick Start',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.0, right: 8.0),
                  child: RaisedButton(
                    onPressed: () => {},
//                    color: Theme.of(context).buttonColor,
//                    textColor: Theme.of(context).primaryTextTheme,
                    elevation: 8.0,
                    child: Text('Start Workout'),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text('Routines',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        FlatButton(
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.add),
                              Text('Routine'),
                            ],
                          ),
                          color: Theme.of(context).buttonColor,
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          SliverGrid(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            delegate: SliverChildListDelegate([
              new ExerciseCard(
                title: "Monday",
                workouts: <String>['Barbell Curl', 'Pull ups', 'Dumbbell curls','Pull downs', 'Sit ups'],
                icon: Icons.fitness_center,
              ),
              new ExerciseCard(
                title: "Tuesday",
                workouts: <String>['Barbell Curl', 'Pull ups', 'Dumbbell curls','Pull downs', 'Sit ups'],
                icon: Icons.fitness_center,
              ),
              new ExerciseCard(
                title: "Wednesday",
                workouts: <String>['Barbell Curl', 'Pull ups', 'Dumbbell curls','Pull downs', 'Sit ups'],
                icon: Icons.fitness_center,
              ),
              new ExerciseCard(
                title: "Thursday",
                workouts: <String>['Barbell Curl', 'Pull ups', 'Dumbbell curls','Pull downs', 'Sit ups'],
                icon: Icons.fitness_center,
              ),
              new ExerciseCard(
                title: "Friday",
                workouts: <String>['Barbell Curl', 'Pull ups', 'Dumbbell curls','Pull downs', 'Sit ups'],
                icon: Icons.fitness_center,
              ),
            ]),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Text(
                    'Example Routines',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                new ExerciseCard(
                  title: "Monday",
                  workouts: <String>['Barbell Curl', 'Pull ups', 'Dumbbell curls','Pull downs', 'Sit ups'],
                  icon: Icons.fitness_center,
                ),
                new ExerciseCard(
                  title: "Tuesday",
                  workouts: <String>['Barbell Curl', 'Pull ups', 'Dumbbell curls','Pull downs', 'Sit ups'],
                  icon: Icons.fitness_center,
                ),
                new ExerciseCard(
                  title: "Wednesday",
                  workouts: <String>['Barbell Curl', 'Pull ups', 'Dumbbell curls','Pull downs', 'Sit ups'],
                  icon: Icons.fitness_center,
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
