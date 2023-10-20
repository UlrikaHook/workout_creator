// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Exercise _$ExerciseFromJson(Map<String, dynamic> json) => Exercise(
      name: json['name'] as String,
      description: json['description'] as String?,
      weight: json['weight'] as String,
      sets: json['sets'] as String,
      reps: json['reps'] as String,
      rest: json['rest'] as String,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$ExerciseToJson(Exercise instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'weight': instance.weight,
      'sets': instance.sets,
      'reps': instance.reps,
      'rest': instance.rest,
    };
