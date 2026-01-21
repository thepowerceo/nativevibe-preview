import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fittrack/providers/workout_provider.dart';
import 'package:fittrack/screens/add_workout_screen.dart';
import 'package:fittrack/widgets/workout_card.dart';

/// The main screen of the app, displaying the list of logged workouts.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _navigateToAddWorkout(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const AddWorkoutScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Workout History'),
      ),
      body: Consumer<WorkoutProvider>(
        builder: (context, workoutProvider, child) {
          final workouts = workoutProvider.workouts;
          if (workouts.isEmpty) {
            return Center(
              child: Text(
                'No workouts logged yet.\nTap the + button to add one!',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: workouts.length,
            itemBuilder: (context, index) {
              return WorkoutCard(workout: workouts[index]);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateToAddWorkout(context),
        tooltip: 'Add Workout',
        child: const Icon(Icons.add),
      ),
    );
  }
}