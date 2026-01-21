import 'package:fittrack/providers/workout_provider.dart';
import 'package:fittrack/screens/workout_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

/// The main screen displaying a list of logged workouts.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _showAddWorkoutDialog(BuildContext context) {
    final nameController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('New Workout'),
        content: Form(
          key: formKey,
          child: TextFormField(
            controller: nameController,
            autofocus: true,
            decoration: const InputDecoration(labelText: 'Workout Name'),
            validator: (value) => (value == null || value.trim().isEmpty)
                ? 'Please enter a name.'
                : null,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                Provider.of<WorkoutProvider>(context, listen: false)
                    .addWorkout(nameController.text);
                Navigator.of(ctx).pop();
              }
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Workout History'),
      ),
      body: Consumer<WorkoutProvider>(
        builder: (context, provider, child) {
          if (provider.workouts.isEmpty) {
            return const Center(child: Text('No workouts logged yet.'));
          }
          return ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: provider.workouts.length,
            itemBuilder: (ctx, i) {
              final workout = provider.workouts[i];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
                child: ListTile(
                  title: Text(workout.name,
                      style: Theme.of(context).textTheme.titleMedium),
                  subtitle: Text(DateFormat.yMMMd().add_jm().format(workout.date)),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => WorkoutDetailsScreen(workoutId: workout.id),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddWorkoutDialog(context),
        tooltip: 'Add Workout',
        child: const Icon(Icons.add),
      ),
    );
  }
}