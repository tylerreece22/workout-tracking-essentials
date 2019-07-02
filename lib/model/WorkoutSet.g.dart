// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'WorkoutSet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkoutSet _$WorkoutSetFromJson(Map<String, dynamic> json) {
  return WorkoutSet(json['setNumber'] as int, json['previous'] as String,
      json['weight'] as int, json['reps'] as int);
}

Map<String, dynamic> _$WorkoutSetToJson(WorkoutSet instance) =>
    <String, dynamic>{
      'setNumber': instance.setNumber,
      'previous': instance.previous,
      'weight': instance.weight,
      'reps': instance.reps
    };
