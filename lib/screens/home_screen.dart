import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fit_track/services/workout_provider.dart';
import 'package:fit_track/widgets/workout_card.dart';
import 'package:fit_track/screens/add_workout_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FitTrack Dashboard'),
        centerTitle: true,
      ),
      body: Consumer<WorkoutProvider>(
        builder: (context, workoutProvider, child) {
          if (workoutProvider.workouts.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.fitness_center, size: 80, color: Colors.grey[700]),
                  const SizedBox(height: 16),
                  Text(
                    'No workouts logged yet.',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Tap the + button to add your first workout!',
                     style: TextStyle(color: Colors.grey[500]),
                  ),
                ],
              ),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: workoutProvider.workouts.length,
            itemBuilder: (context, index) {
              final workout = workoutProvider.workouts[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: WorkoutCard(workout: workout),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const AddWorkoutScreen()),
          );
        },
        tooltip: 'Add Workout',
        child: const Icon(Icons.add, size: 28),
      ),
    );
  }
}