import 'package:json_annotation/json_annotation.dart';
import 'package:workout_creator/models/workout.dart';

part 'workout_list.g.dart';

@JsonSerializable()
class WorkoutList {
  final List<Workout> workouts;

  WorkoutList({required this.workouts});

  factory WorkoutList.fromJson(Map<String, dynamic> json) => _$WorkoutListFromJson(json);
  Map<String, dynamic> toJson() => _$WorkoutListToJson(this);
}