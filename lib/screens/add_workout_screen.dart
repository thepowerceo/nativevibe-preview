import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fittrack/models/workout.dart';
import 'package:fittrack/providers/workout_provider.dart';

/// A screen for adding a new workout entry.
class AddWorkoutScreen extends StatefulWidget {
  /// Creates an AddWorkoutScreen.
  const AddWorkoutScreen({super.key});

  @override
  State<AddWorkoutScreen> createState() => _AddWorkoutScreenState();
}

class _AddWorkoutScreenState extends State<AddWorkoutScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _durationController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _durationController.dispose();
    super.dispose();
  }

  void _saveWorkout() {
    if (_formKey.currentState?.validate() ?? false) {
      final newWorkout = Workout(
        id: DateTime.now().toIso8601String(),
        name: _nameController.text,
        durationInMinutes: int.parse(_durationController.text),
        date: DateTime.now(),
        exercises: [], // Simplified for this example
      );

      context.read<WorkoutProvider>().addWorkout(newWorkout);

      if (mounted) {
        Navigator.of(context).pop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log New Workout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Workout Name (e.g., Chest Day)',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter a name' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _durationController,
                decoration: const InputDecoration(
                  labelText: 'Duration (in minutes)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) return 'Please enter a duration';
                  if (int.tryParse(value) == null) return 'Enter a valid number';
                  return null;
                },
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: _saveWorkout,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                child: const Text('Save Workout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}