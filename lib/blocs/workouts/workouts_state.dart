part of 'workouts_bloc.dart';

class WorkoutsState {
  List<Workout> workouts;

  WorkoutsState({required this.workouts});

  WorkoutsState update({required List<Workout> workouts}) {
    return WorkoutsState(workouts: workouts);
  }
}