import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fittrack/models/exercise.dart';
import 'package:fittrack/models/workout.dart';
import 'package:fittrack/providers/workout_provider.dart';

/// A screen for logging a new workout.
class AddWorkoutScreen extends StatefulWidget {
  const AddWorkoutScreen({super.key});

  @override
  State<AddWorkoutScreen> createState() => _AddWorkoutScreenState();
}

class _AddWorkoutScreenState extends State<AddWorkoutScreen> {
  final _formKey = GlobalKey<FormState>();
  final _workoutNameController = TextEditingController();
  
  // For simplicity, we'll add one hardcoded exercise type
  final _exerciseName = 'New Exercise';
  final _setsController = TextEditingController();
  final _repsController = TextEditingController();
  final _weightController = TextEditingController();

  @override
  void dispose() {
    _workoutNameController.dispose();
    _setsController.dispose();
    _repsController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final newExercise = Exercise(
        id: DateTime.now().toIso8601String(),
        name: _exerciseName, // Simplified
        sets: int.parse(_setsController.text),
        reps: int.parse(_repsController.text),
        weight: double.parse(_weightController.text),
      );

      final newWorkout = Workout(
        id: DateTime.now().toIso8601String(),
        name: _workoutNameController.text,
        date: DateTime.now(),
        exercises: [newExercise], // Simplified to one exercise
      );

      Provider.of<WorkoutProvider>(context, listen: false).addWorkout(newWorkout);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log New Workout'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Workout Details', style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 16),
              TextFormField(
                controller: _workoutNameController,
                decoration: const InputDecoration(labelText: 'Workout Name (e.g., Back & Biceps)'),
                validator: (value) => value!.isEmpty ? 'Please enter a name' : null,
              ),
              const SizedBox(height: 24),
              Text('Add an Exercise', style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 16),
              TextFormField(
                controller: _setsController,
                decoration: const InputDecoration(labelText: 'Sets'),
                keyboardType: TextInputType.number,
                validator: (value) => value!.isEmpty ? 'Enter sets' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _repsController,
                decoration: const InputDecoration(labelText: 'Reps'),
                keyboardType: TextInputType.number,
                validator: (value) => value!.isEmpty ? 'Enter reps' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _weightController,
                decoration: const InputDecoration(labelText: 'Weight (kg)'),
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                validator: (value) => value!.isEmpty ? 'Enter weight' : null,
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
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