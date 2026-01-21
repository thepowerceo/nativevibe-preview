import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fittrack/services/workout_provider.dart';
import 'package:fittrack/widgets/add_workout_dialog.dart';
import 'package:fittrack/widgets/workout_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _showAddWorkoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => const AddWorkoutDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FitTrack'),
      ),
      body: Consumer<WorkoutProvider>(
        builder: (context, workoutProvider, child) {
          if (workoutProvider.workouts.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.line_weight,
                    size: 80,
                    color: Colors.grey[700],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No workouts yet.',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Tap the + button to add your first workout!',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: workoutProvider.workouts.length,
            itemBuilder: (ctx, index) {
              final workout = workoutProvider.workouts[index];
              return WorkoutCard(workout: workout);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddWorkoutDialog(context),
        tooltip: 'Log Workout',
        child: const Icon(Icons.add, size: 28),
      ),
    );
  }
}