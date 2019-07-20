// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Workout.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Workout _$WorkoutFromJson(Map<String, dynamic> json) {
  return Workout(
      json['name'] as String,
      (json['sets'] as List)
          ?.map((e) =>
              e == null ? null : WorkoutSet.fromJson(e as Map<String, dynamic>))
          ?.toList())
    ..id = json['id'] as String;
}

Map<String, dynamic> _$WorkoutToJson(Workout instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'sets': instance.sets
    };
