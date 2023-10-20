import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_creator/blocs/active_exercise/active_workout_bloc.dart';
import 'package:workout_creator/screens/run_workout.dart';
import 'package:workout_creator/screens/workouts.dart';

import 'blocs/workouts/workouts_bloc.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<WorkoutsBloc>(
        create: (BuildContext context) => WorkoutsBloc()..add(InitState()),
      ),
      BlocProvider<ActiveWorkoutBloc>(
        create: (BuildContext context) => ActiveWorkoutBloc(),
      ),
    ],
    child: MaterialApp(
      home: const Workouts(),
      routes: {
        // '/add-workout': (context) => const AddWorkout(),
        // '/edit-workout': (context) => const EditWorkout(),
        '/run-workout': (context) => const RunWorkout()
      },
    ),
  ));
}
