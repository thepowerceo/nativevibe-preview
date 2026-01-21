import 'package:fittrack/models/exercise.dart';
import 'package:fittrack/providers/workout_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Shows a dialog to add a new exercise to a workout.
Future<void> showAddExerciseDialog(BuildContext context, String workoutId) {
  final formKey = GlobalKey<FormState>();
  final nameCtrl = TextEditingController();
  final setsCtrl = TextEditingController();
  final repsCtrl = TextEditingController();
  final weightCtrl = TextEditingController();

  return showDialog<void>(
    context: context,
    builder: (dialogContext) {
      return AlertDialog(
        title: const Text('Add Exercise'),
        content: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextFormField(
                  controller: nameCtrl,
                  decoration: const InputDecoration(labelText: 'Exercise Name'),
                  validator: (v) => v!.isEmpty ? 'Enter a name' : null,
                ),
                TextFormField(
                  controller: setsCtrl,
                  decoration: const InputDecoration(labelText: 'Sets'),
                  keyboardType: TextInputType.number,
                  validator: (v) => v!.isEmpty ? 'Enter sets' : null,
                ),
                TextFormField(
                  controller: repsCtrl,
                  decoration: const InputDecoration(labelText: 'Reps'),
                  keyboardType: TextInputType.number,
                  validator: (v) => v!.isEmpty ? 'Enter reps' : null,
                ),
                TextFormField(
                  controller: weightCtrl,
                  decoration: const InputDecoration(labelText: 'Weight (kg)'),
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  validator: (v) => v!.isEmpty ? 'Enter weight' : null,
                ),
              ],
            ),
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                final newExercise = Exercise(
                  id: 'e${DateTime.now().millisecondsSinceEpoch}',
                  name: nameCtrl.text,
                  sets: int.parse(setsCtrl.text),
                  reps: int.parse(repsCtrl.text),
                  weight: double.parse(weightCtrl.text),
                );

                Provider.of<WorkoutProvider>(context, listen: false)
                    .addExerciseToWorkout(workoutId, newExercise);

                Navigator.of(dialogContext).pop();
              }
            },
            child: const Text('Add'),
          ),
        ],
      );
    },
  );
}