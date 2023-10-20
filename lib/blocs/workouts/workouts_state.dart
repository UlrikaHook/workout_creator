part of 'workouts_bloc.dart';

class WorkoutsState {
  List<Workout> workouts;

  WorkoutsState({required this.workouts});

  WorkoutsState update({required List<Workout> workouts}) {
    SharedPreferencesService.setStoredObject(WorkoutList(workouts: workouts));
    return WorkoutsState(workouts: workouts);
  }

}

class LoadingState extends WorkoutsState {
    LoadingState() : super(workouts: []);
  }

class LoadedState extends WorkoutsState {
    LoadedState(data): super(workouts: data);
}