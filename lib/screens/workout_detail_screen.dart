import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:vibrant_fit/models/workout_model.dart';

class WorkoutDetailScreen extends StatelessWidget {
  final Workout workout;

  const WorkoutDetailScreen({super.key, required this.workout});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(workout.name),
        backgroundColor: theme.colorScheme.surface.withAlpha(190),
        elevation: 1,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildHeader(context, theme),
          const SizedBox(height: 24),
          Text(
            'Exercises',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(height: 24),
          if (workout.exercises.isEmpty)
            _buildEmptyExerciseState(context, theme)
          else
            _buildExerciseList(theme),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context, ThemeData theme) {
    return Card(
      color: theme.colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Date', style: theme.textTheme.labelMedium),
                Text(
                  DateFormat.yMMMMd().format(workout.date),
                  style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('Exercises', style: theme.textTheme.labelMedium),
                Text(
                  '${workout.exercises.length}',
                  style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExerciseList(ThemeData theme) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: workout.exercises.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final exercise = workout.exercises[index];
        return Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(color: theme.dividerColor)),
          child: ListTile(
            title: Text(exercise.name, style: theme.textTheme.titleMedium),
            subtitle: Text('${exercise.sets} sets x ${exercise.reps} reps'),
            trailing: Text(
              '${exercise.weight} kg',
              style: theme.textTheme.titleMedium?.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildEmptyExerciseState(BuildContext context, ThemeData theme) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40.0),
      alignment: Alignment.center,
      child: Column(
        children: [
          Icon(Icons.list_alt_rounded, size: 50, color: theme.colorScheme.onSurface.withOpacity(0.4)),
          const SizedBox(height: 16),
          Text('No exercises in this workout.',
            style: theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.onSurface.withOpacity(0.6)),
          ),
        ],
      ),
    );
  }
}