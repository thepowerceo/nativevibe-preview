import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/workout_model.dart';

class WorkoutCard extends StatelessWidget {
  final Workout workout;

  const WorkoutCard({super.key, required this.workout});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  DateFormat.yMMMMd().format(workout.date),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: colorScheme.primary,
                  ),
                ),
                Text(
                  '${workout.exercises.length} exercises',
                  style: TextStyle(
                    color: colorScheme.secondary,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const Divider(height: 24),
            ...workout.exercises.map((exercise) => Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(exercise.name, style: const TextStyle(fontSize: 16)),
                      Text(
                        '${exercise.sets} sets x ${exercise.reps} reps',
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).textTheme.bodySmall?.color,
                        ),
                      ),
                    ],
                  ),
                )).toList(),
            if (workout.notes != null && workout.notes!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Text(
                  'Notes: ${workout.notes}',
                  style: TextStyle(fontStyle: FontStyle.italic, color: colorScheme.onSurfaceVariant),
                ),
              ),
          ],
        ),
      ),
    );
  }
}