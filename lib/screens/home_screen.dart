import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fittrack/providers/workout_provider.dart';
import 'package:fittrack/screens/add_workout_screen.dart';
import 'package:fittrack/widgets/workout_list_item.dart';

/// The main screen displaying the list of logged workouts.
class HomeScreen extends StatelessWidget {
  /// Creates a HomeScreen.
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Workout Log'),
        centerTitle: true,
      ),
      body: Consumer<WorkoutProvider>(
        builder: (context, workoutProvider, child) {
          final workouts = workoutProvider.workouts;
          if (workouts.isEmpty) {
            return child!;
          } else {
            return ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: workouts.length,
              itemBuilder: (ctx, i) => WorkoutListItem(workout: workouts[i]),
            );
          }
        },
        child: const Center(
          child: Text(
            'No workouts logged yet.\nTap + to add one!',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (ctx) => const AddWorkoutScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}