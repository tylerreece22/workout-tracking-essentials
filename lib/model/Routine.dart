import 'Workout.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Routine.g.dart';

@JsonSerializable()
class Routine {
  String name;
  List<Workout> workouts;

  Routine(this.name, this.workouts);

  factory Routine.fromJson(Map<String, dynamic> json) => _$RoutineFromJson(json);

  Map<String, dynamic> toJson() => _$RoutineToJson(this);

}