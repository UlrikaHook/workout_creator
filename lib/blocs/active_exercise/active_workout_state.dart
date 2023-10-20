part of 'active_workout_bloc.dart';

class ActiveWorkoutState {
  Workout? workout;

  ActiveWorkoutState({this.workout});

  ActiveWorkoutState update({Workout? workout}) {
    return ActiveWorkoutState(workout: workout);
  }
}