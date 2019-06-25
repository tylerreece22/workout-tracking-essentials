import 'package:flutter/material.dart';
import 'package:workout_tracking_essentials/exercise/RoutineCard.dart';

class MyRoutines extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
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
        new ExerciseCard(
          title: "Thursday",
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
          title: "Friday",
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
    );
  }
}
