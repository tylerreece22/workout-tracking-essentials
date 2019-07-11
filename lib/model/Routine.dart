import 'Workout.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'Routine.g.dart';

@JsonSerializable()
class Routine {
  String name;
  String id;
  List<Workout> workouts;

  Routine(this.name, this.workouts) {
    Uuid uuid = new Uuid();
    this.id = uuid.v4();
  }

  factory Routine.fromJson(Map<String, dynamic> json) => _$RoutineFromJson(json);

  Map<String, dynamic> toJson() => _$RoutineToJson(this);

}