import 'package:fittrack/models/workout.dart';
import 'package:fittrack/providers/workout_provider.dart';
import 'package:fittrack/widgets/add_exercise_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Displays the details of a single workout, including its exercises.
class WorkoutDetailsScreen extends StatelessWidget {
  final String workoutId;

  const WorkoutDetailsScreen({super.key, required this.workoutId});

  @override
  Widget build(BuildContext context) {
    return Consumer<WorkoutProvider>(
      builder: (context, provider, child) {
        final Workout workout = provider.workouts.firstWhere((w) => w.id == workoutId);

        return Scaffold(
          appBar: AppBar(
            title: Text(workout.name),
          ),
          body: workout.exercises.isEmpty
              ? const Center(
                  child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'No exercises added yet. Tap the + button to add one!',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                ))
              : ListView.builder(
                  padding: const EdgeInsets.all(8.0),
                  itemCount: workout.exercises.length,
                  itemBuilder: (ctx, index) {
                    final exercise = workout.exercises[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
                      child: ListTile(
                        title: Text(exercise.name),
                        subtitle: Text('${exercise.sets} sets x ${exercise.reps} reps'),
                        trailing: Text('${exercise.weight} kg'),
                      ),
                    );
                  },
                ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => showAddExerciseDialog(context, workout.id),
            tooltip: 'Add Exercise',
            child: const Icon(Icons.fitness_center),
          ),
        );
      },
    );
  }
}