import 'package:flutter/material.dart';
import 'package:fittrack/models/workout.dart';
import 'package:intl/intl.dart';

/// A card widget to display a summary of a single workout.
class WorkoutCard extends StatelessWidget {
  final Workout workout;

  const WorkoutCard({super.key, required this.workout});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              workout.name,
              style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              DateFormat.yMMMMd().format(workout.date),
              style: textTheme.bodyMedium?.copyWith(color: colorScheme.onSurfaceVariant),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStat(context, Icons.fitness_center, '${workout.totalVolume.toStringAsFixed(0)} kg', 'Total Volume'),
                _buildStat(context, Icons.timer_outlined, '${workout.durationInMinutes} min', 'Duration'),
                _buildStat(context, Icons.repeat, '${workout.exercises.length} exercises', 'Moves'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStat(BuildContext context, IconData icon, String value, String label) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        Icon(icon, color: colorScheme.primary, size: 24),
        const SizedBox(height: 4),
        Text(value, style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
        Text(label, style: textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant)),
      ],
    );
  }
}