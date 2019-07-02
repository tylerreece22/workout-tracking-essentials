import 'WorkoutSet.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Workout.g.dart';

@JsonSerializable()
class Workout {
  String name;
  List<WorkoutSet> sets;

  Workout(this.name, this.sets);

  factory Workout.fromJson(Map<String, dynamic> json) => _$WorkoutFromJson(json);

  Map<String, dynamic> toJson() => _$WorkoutToJson(this);

}