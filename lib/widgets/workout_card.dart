import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flextrack_pro/models/workout.dart';

class WorkoutCard extends StatelessWidget {
  final Workout workout;

  const WorkoutCard({super.key, required this.workout});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Theme.of(context).dividerColor),
        borderRadius: BorderRadius.circular(16),
      ),
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  workout.title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  DateFormat('MMM d, yyyy').format(workout.date),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
            const Divider(height: 24),
            ...workout.exercises.take(3).map((e) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Row(
                children: [
                  const Icon(Icons.done, size: 16, color: Colors.green),
                  const SizedBox(width: 8),
                  Text('${e.name}: ${e.sets} x ${e.reps} @ ${e.weight}kg'),
                ],
              ),
            )),
            if (workout.exercises.length > 3)
              Text('+ ${workout.exercises.length - 3} more exercises', 
                   style: TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: 12)),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                'Total Volume: ${workout.totalVolume.toStringAsFixed(1)} kg',
                style: TextStyle(
                  fontSize: 12, 
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onPrimaryContainer
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}