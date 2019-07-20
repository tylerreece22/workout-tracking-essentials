import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'WorkoutSet.g.dart';

@JsonSerializable()
class WorkoutSet {
  String id;
  int setNumber;
  String previous;
  int weight;
  int reps;
  bool done;

  WorkoutSet(this.setNumber, this.previous, this.weight, this.reps) {
    Uuid uuid = new Uuid();
    this.id = uuid.v4();
  }

  WorkoutSet.withDone(
      this.setNumber, this.previous, this.weight, this.reps, this.done);

  factory WorkoutSet.fromJson(Map<String, dynamic> json) =>
      _$WorkoutSetFromJson(json);

  Map<String, dynamic> toJson() => _$WorkoutSetToJson(this);
}
