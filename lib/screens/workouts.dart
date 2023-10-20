import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_creator/blocs/active_exercise/active_workout_bloc.dart';
import 'package:workout_creator/blocs/workouts/workouts_bloc.dart';
import 'package:workout_creator/models/exercise.dart';
import 'package:workout_creator/models/workout.dart';

class Workouts extends StatelessWidget {
  const Workouts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
        builder: (context) {
          final workoutsState = context.watch<WorkoutsBloc>().state;
          if (workoutsState is LoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          return Scaffold(
            appBar: AppBar(
              title: const Text('Workouts'),
            ),
            body: Container(
                margin: EdgeInsets.all(10.0),
                child: ListView(
                  children: workoutsState.workouts.map((workout) {
                    return Card(
                      clipBehavior: Clip.hardEdge,
                      child: InkWell(
                            onTap: () {
                              context.read<ActiveWorkoutBloc>().add(ActivateWorkout(workout: workout));
                              Navigator.pushNamed(context, '/run-workout');
                            },
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10.0, 8.0, 0.0, 10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      workout.name,
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                      ),
                                    ),
                                    flex: 3
                                  ),
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: IconButton(
                                            icon: const Icon(Icons.edit),
                                            iconSize: 20.0,
                                            onPressed: () {},
                                          ),
                                        ),
                                        Expanded(
                                          child: IconButton(
                                            icon: const Icon(Icons.delete),
                                            iconSize: 20.0,
                                            onPressed: () {},
                                          ),
                                        ),
                                      ]
                                    ),
                                    flex: 1,
                                  )
                                ]
                              ),
                            ),
                          )
                      );
                    }
                ).toList())
            ),
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                context.read<WorkoutsBloc>().add(AddWorkout(
                    workout: Workout(
                        name: 'Test workout',
                        exercises: [
                          Exercise(name: 'Bicepscurl', description: 'Maskin', weight: '20', sets: '3', reps: '10', rest: '30')
                        ]
                    )
                ));
              },
            ),
          );
        }
    );
  }
}
