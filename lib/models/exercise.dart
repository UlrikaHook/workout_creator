import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'exercise.g.dart';

@JsonSerializable()
class Exercise {
  String id;
  String name;
  String? description;
  String weight;
  String sets;
  String reps;
  String rest;

  Exercise({
    required this.name,
    this.description,
    required this.weight,
    required this.sets,
    required this.reps,
    required this.rest,
    String? id
  }) : id = id ?? const Uuid().toString();

  factory Exercise.fromJson(Map<String, dynamic> json) => _$ExerciseFromJson(json);
  Map<String, dynamic> toJson() => _$ExerciseToJson(this);
}