import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
import 'package:workout_creator/models/exercise.dart';
import 'package:workout_creator/models/workout.dart';

part 'workouts_state.dart';
part 'workouts_event.dart';

class WorkoutsBloc extends Bloc<WorkoutsEvent, WorkoutsState> {
  WorkoutsBloc() : super(WorkoutsState(workouts: [])) {
    on<AddWorkout>(
        (AddWorkout event, emit) {
          state.workouts.add(event.workout);
          emit(state.update(workouts: state.workouts));
        }
    );
    on<RemoveWorkout>(
        (RemoveWorkout event, emit) {
          state.workouts.removeWhere((workout) => workout.id == event.workout.id);
          emit(state.update(workouts: state.workouts));
        }
    );
    on<AddExercise>(
        (AddExercise event, emit) {
          Workout changedWorkout = state.workouts.firstWhere((workout) => workout.id == event.workoutId);
          changedWorkout.exercises.add(event.exercise);
          emit(state.update(workouts: state.workouts));
        }
    );
  }
}