import 'package:json_annotation/json_annotation.dart';

import 'exercise.dart';
import 'package:uuid/uuid.dart';

part 'workout.g.dart';

@JsonSerializable()
class Workout {
  String id;
  String name;
  List<Exercise> exercises = [];

  Workout({required this.name, required this.exercises, String? id}) : id = id ?? const Uuid().toString();

  factory Workout.fromJson(Map<String, dynamic> json) => _$WorkoutFromJson(json);
  Map<String, dynamic> toJson() => _$WorkoutToJson(this);
}