part of 'workouts_bloc.dart';

class WorkoutsEvent {}

class InitState extends WorkoutsEvent {}

class AddWorkout extends WorkoutsEvent {
  Workout workout;
  AddWorkout({required this.workout});
}

class RemoveWorkout extends WorkoutsEvent {
  Workout workout;
  RemoveWorkout({required this.workout});
}

class AddExercise extends WorkoutsEvent {
  Uuid workoutId;
  Exercise exercise;
  AddExercise({required this.workoutId, required this.exercise});
}


class RemoveExercise extends WorkoutsEvent {
  Exercise exercise;
  RemoveExercise({required this.exercise});
}

class EditExercise extends WorkoutsEvent {
  Exercise exercise;
  EditExercise({required this.exercise});
}