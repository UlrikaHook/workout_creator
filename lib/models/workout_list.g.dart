// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkoutList _$WorkoutListFromJson(Map<String, dynamic> json) => WorkoutList(
      workouts: (json['workouts'] as List<dynamic>)
          .map((e) => Workout.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WorkoutListToJson(WorkoutList instance) =>
    <String, dynamic>{
      'workouts': instance.workouts,
    };
