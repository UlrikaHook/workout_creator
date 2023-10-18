import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_creator/screens/workouts.dart';

import 'blocs/workouts/workouts_bloc.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<WorkoutsBloc>(
        create: (BuildContext context) => WorkoutsBloc(),
      ),
    ],
    child: MaterialApp(
      home: Workouts(),
      routes: {
        // '/add-workout': (context) => const AddWorkout(),
        // '/edit-workout': (context) => const EditWorkout(),
        //'/run-workout': (context) => const RunWorkout()
      },
    ),
  ));
}
