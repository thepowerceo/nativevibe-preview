import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:fit_track/models/workout_model.dart';

class WorkoutCard extends StatelessWidget {
  final Workout workout;

  const WorkoutCard({super.key, required this.workout});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
          title: Text(
            workout.name,
            style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              DateFormat.yMMMMd().add_jm().format(workout.dateTime),
              style: textTheme.bodyMedium?.copyWith(color: Colors.grey[400]),
            ),
          ),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 16),
              child: Column(
                children: workout.exercises.map((exercise) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(exercise.name, style: textTheme.bodyLarge),
                        Text(
                          '${exercise.sets}x${exercise.reps} @ ${exercise.weight}kg',
                          style: textTheme.bodyMedium?.copyWith(color: colorScheme.primary),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}