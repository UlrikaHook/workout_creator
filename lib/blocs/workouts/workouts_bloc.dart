import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
import 'package:workout_creator/models/exercise.dart';
import 'package:workout_creator/models/workout.dart';
import 'package:workout_creator/models/workout_list.dart';
import 'package:workout_creator/service/shared_preferences_service.dart';


part 'workouts_state.dart';
part 'workouts_event.dart';

class WorkoutsBloc extends Bloc<WorkoutsEvent, WorkoutsState> {

  WorkoutsBloc() : super(LoadingState()) {
    on<InitState>(
        (InitState event, emit) async {
          WorkoutList value = await SharedPreferencesService.getStoredObject();
          emit(state.update(workouts: value.workouts));
          LoadedState(value.workouts);
        }
    );
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
    on<EditExercise>(
        (EditExercise event, emit) {
          Exercise changedExercise;

          for (int i = 0; i < state.workouts.length; i++) {
            int index = state.workouts[i].exercises.indexWhere(
              (exercise) => exercise.id == event.exercise.id
            );
            if (index != -1) {
              changedExercise = state.workouts[i].exercises[index];
              break;
            }
          }

          changedExercise = event.exercise;
          emit(state.update(workouts: state.workouts));
        }
    );
  }
}