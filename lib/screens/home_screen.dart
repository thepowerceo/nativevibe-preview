import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:vibrant_fit/services/workout_provider.dart';
import 'package:vibrant_fit/widgets/workout_card.dart';
import 'package:vibrant_fit/widgets/add_workout_dialog.dart';
import 'package:vibrant_fit/models/workout_model.dart';
import 'package:vibrant_fit/screens/workout_detail_screen.dart';

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
        title: Text(
          'VibrantFit',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: Consumer<WorkoutProvider>(
        builder: (context, workoutProvider, child) {
          final workouts = workoutProvider.workouts;
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: workouts.isEmpty
                ? _buildEmptyState(context)
                : _buildWorkoutList(context, workouts),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddWorkoutDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      key: const ValueKey('empty_state'),
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.fitness_center_rounded,
              size: 80,
              color: Theme.of(context).colorScheme.primary.withOpacity(0.7),
            ),
            const SizedBox(height: 20),
            Text(
              'No Workouts Logged',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              'Tap the \'+\' button to add your first workout!',
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWorkoutList(BuildContext context, List<Workout> workouts) {
    return ListView.builder(
      key: const ValueKey('workout_list'),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      itemCount: workouts.length,
      itemBuilder: (context, index) {
        final workout = workouts[index];
        return WorkoutCard(
          workout: workout,
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => WorkoutDetailScreen(workout: workout),
              ),
            );
          },
        );
      },
    );
  }
}