// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'WorkoutSet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkoutSet _$WorkoutSetFromJson(Map<String, dynamic> json) {
  return WorkoutSet(json['setNumber'] as int, json['previous'] as String,
      json['weight'] as int, json['reps'] as int)
    ..id = json['id'] as String
    ..done = json['done'] as bool;
}

Map<String, dynamic> _$WorkoutSetToJson(WorkoutSet instance) =>
    <String, dynamic>{
      'id': instance.id,
      'setNumber': instance.setNumber,
      'previous': instance.previous,
      'weight': instance.weight,
      'reps': instance.reps,
      'done': instance.done
    };
