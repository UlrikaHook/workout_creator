import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:workout_creator/blocs/active_exercise/active_workout_bloc.dart';
import 'package:workout_creator/blocs/workouts/workouts_bloc.dart';
import 'package:workout_creator/models/exercise.dart';
import 'package:workout_creator/utils/dialog_builder.dart';

class RunWorkout extends StatefulWidget {
  const RunWorkout({Key? key}) : super(key: key);

  @override
  State<RunWorkout> createState() => _RunWorkoutState();
}

class _RunWorkoutState extends State<RunWorkout> {
  List<String> completedExercises = [];
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActiveWorkoutBloc, ActiveWorkoutState>(
        builder: (context, state) {
          if (state.workout == null) {
            return const SizedBox.shrink();
          }
          return Scaffold(
            appBar: AppBar(
              title: const Text('Run workout'),
            ),
            body: Container(
                margin: const EdgeInsets.all(10.0),
                child: ListView(
                    children: state.workout!.exercises.map((exercise) {
                      return Card(
                          color: completedExercises.contains(exercise.id) ? Colors.green[50] : Colors.white,
                          clipBehavior: Clip.hardEdge,
                          child: InkWell(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10.0, 8.0, 0.0, 10.0),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 4,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            exercise.name,
                                            style: const TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10.0,
                                            height: 10.0
                                          ),
                                          if (exercise.description != null) ...[
                                            Text(
                                              exercise.description!,
                                              style: const TextStyle(
                                                  fontStyle: FontStyle.italic
                                              ),
                                            ),
                                            const SizedBox(
                                                width: 10.0,
                                                height: 10.0
                                            ),
                                          ],
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('Set: ${exercise.sets}'),
                                              Text('Reps: ${exercise.reps}'),
                                              Text('Rest: ${exercise.rest} s'),
                                            ]
                                          )
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                          children: [
                                            Expanded(
                                              child: IconButton(
                                                tooltip: completedExercises.contains(exercise.id) ? 'Mark as not completed' : 'Mark as completed',
                                                color: completedExercises.contains(exercise.id) ? Colors.green : Colors.grey,
                                                icon: completedExercises.contains(exercise.id) ? const Icon(Icons.check_circle): const Icon(Icons.check_circle_outline),
                                                iconSize: 20.0,
                                                onPressed: () async {
                                                  String snackText;
                                                  if (completedExercises.contains(exercise.id)) {
                                                    snackText = '${exercise.name} marked as not completed';
                                                    completedExercises.remove(exercise.id);
                                                  } else {
                                                    snackText = '${exercise.name} marked as completed';
                                                    await _dialogBuilder(context, exercise);
                                                    completedExercises.add(exercise.id);
                                                  }

                                                  setState(() {
                                                    completedExercises = completedExercises;
                                                  });

                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                     SnackBar(content: Text(snackText)),
                                                  );
                                                },
                                              ),
                                            ),
                                            // Expanded(
                                            //   child: IconButton(
                                            //     icon: const Icon(Icons.edit),
                                            //     iconSize: 20.0,
                                            //     onPressed: () {},
                                            //   ),
                                            // ),
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
            )
          );
        }
    );
  }

  Future<void> _dialogBuilder (BuildContext context, Exercise exercise) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return DialogBuilder(
          title: 'Do you want to update your exercise?',
          content: FormBuilder(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  FormBuilderTextField(
                    name: 'sets',
                    initialValue: '${exercise.sets}',
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                    ],
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Sets',
                    ),
                  ),
                  FormBuilderTextField(
                    name: 'reps',
                    initialValue: '${exercise.reps}',
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                    ],
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Reps',
                    ),
                  ),
                  FormBuilderTextField(
                    name: 'rest',
                    initialValue: '${exercise.rest}',
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                    ],
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Rest',
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                  textStyle: const TextStyle(
                      color: Colors.red
                  )
              ),
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Save'),
              onPressed: () {
                final workoutsBloc = BlocProvider.of<WorkoutsBloc>(context);
                exercise.sets = _formKey.currentState?.fields['sets']?.value.toString() ?? '';
                exercise.reps = _formKey.currentState?.fields['reps']?.value.toString() ?? '';
                exercise.rest = _formKey.currentState?.fields['rest']?.value.toString() ?? '';
                workoutsBloc.add(EditExercise(exercise: exercise));
                Navigator.of(context).pop();
              },
            ),
          ]
        );
      },
    );
  }
}
