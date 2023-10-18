import 'exercise.dart';
import 'package:uuid/uuid.dart';

class Workout {
  Uuid id = const Uuid();
  String name;
  List<Exercise> exercises;

  Workout({required this.name, required this.exercises});
}