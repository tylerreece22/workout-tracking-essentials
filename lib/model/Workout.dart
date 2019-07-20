import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

import 'WorkoutSet.dart';

part 'Workout.g.dart';

@JsonSerializable()
class Workout {
  String name;
  String id;
  List<WorkoutSet> sets;

  Workout(this.name, this.sets) {
    Uuid uuid = new Uuid();
    this.id = uuid.v4();
  }

  factory Workout.fromJson(Map<String, dynamic> json) =>
      _$WorkoutFromJson(json);

  Map<String, dynamic> toJson() => _$WorkoutToJson(this);
}
