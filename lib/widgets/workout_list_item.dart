import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:fittrack/models/workout.dart';
import 'package:fittrack/screens/workout_detail_screen.dart';

/// A widget that displays a summary of a single workout in a list.
class WorkoutListItem extends StatelessWidget {
  /// The workout data to display.
  final Workout workout;

  /// Creates a WorkoutListItem.
  const WorkoutListItem({super.key, required this.workout});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 4.0),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        leading: CircleAvatar(
          backgroundColor: colorScheme.primaryContainer,
          foregroundColor: colorScheme.onPrimaryContainer,
          child: const Icon(Icons.fitness_center),
        ),
        title: Text(workout.name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(
          '${DateFormat.yMMMd().format(workout.date)} • ${workout.durationInMinutes} min',
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => WorkoutDetailScreen(workoutId: workout.id),
            ),
          );
        },
      ),
    );
  }
}