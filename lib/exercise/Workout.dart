import 'package:flutter/material.dart';

class Workout {
//  @override
//  State<StatefulWidget> createState() => WorkoutState();
  String workoutName;
  Set<WorkoutSet> sets;

  List<Widget> buildWorkoutSets() {
    WorkoutSet set1 = new WorkoutSet(setNumber: 1, previous: '100lb x 6', weight: 100, reps: 6, completed: false);
    return [
      Text('${set1.setNumber}'),
      Text('${set1.previous}'),
      Text('${set1.weight}'),
      Text('${set1.reps}'),
      Text('${set1.completed}'),
    ];
  }
}

//class WorkoutState extends State<Workout> {
//  String workoutName;
//  List<WorkoutSet> sets;
//
//  @override
//  Widget build(BuildContext context) {
//    return ;
//  }
//}

class WorkoutSet {
  int setNumber;
  String previous;
  int weight;
  int reps;
  bool completed;

  WorkoutSet({this.setNumber, this.previous, this.weight, this.reps, this.completed});
}