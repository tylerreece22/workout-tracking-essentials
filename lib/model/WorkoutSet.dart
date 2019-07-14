import 'package:json_annotation/json_annotation.dart';

part 'WorkoutSet.g.dart';

@JsonSerializable()
class WorkoutSet {
  int setNumber;
  String previous;
  int weight;
  int reps;
  bool done;

  WorkoutSet(this.setNumber, this.previous, this.weight, this.reps);

  WorkoutSet.withDone(this.setNumber, this.previous, this.weight, this.reps, this.done);

  factory WorkoutSet.fromJson(Map<String, dynamic> json) => _$WorkoutSetFromJson(json);

  Map<String, dynamic> toJson() => _$WorkoutSetToJson(this);
}