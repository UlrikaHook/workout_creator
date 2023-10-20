import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_creator/models/workout.dart';

part 'active_workout_event.dart';
part 'active_workout_state.dart';


class ActiveWorkoutBloc extends Bloc<ActiveWorkoutEvent, ActiveWorkoutState> {
  ActiveWorkoutBloc() : super(ActiveWorkoutState()) {
    on<ActivateWorkout>(
      (ActivateWorkout event, emit) {
          emit(state.update(workout: event.workout));
      }
    );
    on<DeactivateWorkout>(
      (DeactivateWorkout event, emit) {
        emit(state.update());
      }
    );
  }
}