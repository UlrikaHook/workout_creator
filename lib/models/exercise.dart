import 'package:uuid/uuid.dart';

class Exercise {
  Uuid id = const Uuid();
  String name;
  String? description;
  int weight;
  int sets;
  int reps;
  int rest;

  Exercise({
    required this.name,
    this.description,
    required this.weight,
    required this.sets,
    required this.reps,
    required this.rest
  });
}