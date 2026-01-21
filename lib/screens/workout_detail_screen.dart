import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:fittrack/models/workout.dart';
import 'package:fittrack/providers/workout_provider.dart';

/// Displays the details of a single workout.
class WorkoutDetailScreen extends StatelessWidget {
  /// The ID of the workout to display.
  final String workoutId;

  /// Creates a WorkoutDetailScreen.
  const WorkoutDetailScreen({super.key, required this.workoutId});

  @override
  Widget build(BuildContext context) {
    final Workout workout = context.read<WorkoutProvider>().findById(workoutId);

    return Scaffold(
      appBar: AppBar(
        title: Text(workout.name),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDetailCard(context, workout),
            const SizedBox(height: 24),
            Text(
              'Exercises',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            _buildExercisesList(workout),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailCard(BuildContext context, Workout workout) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildInfoColumn(Icons.calendar_today, 'Date', DateFormat.yMMMd().format(workout.date)),
            _buildInfoColumn(Icons.timer_outlined, 'Duration', '${workout.durationInMinutes} min'),
            _buildInfoColumn(Icons.fitness_center, 'Exercises', '${workout.exercises.length}'),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoColumn(IconData icon, String label, String value) {
    return Column(
      children: [
        Icon(icon, size: 28),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(value),
      ],
    );
  }

  Widget _buildExercisesList(Workout workout) {
    if (workout.exercises.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text('No exercises were logged for this workout.'),
        ),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: workout.exercises.length,
      itemBuilder: (context, index) {
        final exercise = workout.exercises[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 4.0),
          child: ListTile(
            title: Text(exercise.name, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text('${exercise.sets} sets x ${exercise.reps} reps'),
            trailing: Text('${exercise.weightInKg} kg'),
          ),
        );
      },
    );
  }
}