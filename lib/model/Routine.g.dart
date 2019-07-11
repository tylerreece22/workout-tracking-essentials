// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Routine.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Routine _$RoutineFromJson(Map<String, dynamic> json) {
  return Routine(
      json['name'] as String,
      (json['workouts'] as List)
          ?.map((e) =>
              e == null ? null : Workout.fromJson(e as Map<String, dynamic>))
          ?.toList())
    ..id = json['id'] as String;
}

Map<String, dynamic> _$RoutineToJson(Routine instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'workouts': instance.workouts
    };
