import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:flextrack_pro/providers/workout_provider.dart';
import 'package:flextrack_pro/screens/add_workout_screen.dart';
import 'package:flextrack_pro/widgets/workout_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final workoutData = Provider.of<WorkoutProvider>(context);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('FlexTrack Pro', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: false,
      ),
      body: workoutData.workouts.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.fitness_center, size: 64, color: Theme.of(context).colorScheme.primary.withOpacity(0.5)),
                  const SizedBox(height: 16),
                  const Text('No workouts logged yet.', style: TextStyle(fontSize: 18)),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: workoutData.workouts.length,
              itemBuilder: (ctx, i) => WorkoutCard(workout: workoutData.workouts[i]),
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => const AddWorkoutScreen()),
        ),
        label: const Text('Log Workout'),
        icon: const Icon(Icons.add),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.black,
      ),
    );
  }
}