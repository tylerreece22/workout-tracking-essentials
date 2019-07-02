import 'package:json_annotation/json_annotation.dart';

part 'WorkoutSet.g.dart';

@JsonSerializable()
class WorkoutSet {
  int setNumber;
  String previous;
  int weight;
  int reps;

  WorkoutSet(this.setNumber, this.previous, this.weight, this.reps);

  factory WorkoutSet.fromJson(Map<String, dynamic> json) => _$WorkoutSetFromJson(json);

  Map<String, dynamic> toJson() => _$WorkoutSetToJson(this);
}