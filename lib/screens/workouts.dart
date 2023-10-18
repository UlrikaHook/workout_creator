import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_creator/blocs/workouts/workouts_bloc.dart';
import 'package:workout_creator/models/exercise.dart';
import 'package:workout_creator/models/workout.dart';

class Workouts extends StatelessWidget {
  const Workouts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutsBloc, WorkoutsState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Workouts'),
            ),
            body: Container(
                margin: EdgeInsets.all(10.0),
                child: ListView(
                  children: state.workouts.map((workout) {
                    return Card(
                      clipBehavior: Clip.hardEdge,
                      child: InkWell(
                        onTap: () {
                          print('tap');
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
                          Exercise(name: 'Bicepscurl', description: 'Maskin', weight: 20, sets: 3, reps: 10, rest: 30)
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
