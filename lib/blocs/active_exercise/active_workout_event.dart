part of 'active_workout_bloc.dart';

class ActiveWorkoutEvent {}

class ActivateWorkout extends ActiveWorkoutEvent {
  Workout workout;
  ActivateWorkout({required this.workout});
}

class DeactivateWorkout extends ActiveWorkoutEvent {
  DeactivateWorkout();
}