import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math';

import '../models/exercise_model.dart';
import '../models/workout_model.dart';
import '../services/workout_provider.dart';

class AddWorkoutScreen extends StatefulWidget {
  const AddWorkoutScreen({super.key});

  @override
  State<AddWorkoutScreen> createState() => _AddWorkoutScreenState();
}

class _AddWorkoutScreenState extends State<AddWorkoutScreen> {
  final _notesController = TextEditingController();
  final List<Exercise> _exercises = [];

  void _addExercise() {
    setState(() {
      _exercises.add(Exercise(id: Random().nextDouble().toString(), name: '', sets: 3, reps: 10));
    });
  }

  void _removeExercise(int index) {
    setState(() {
      _exercises.removeAt(index);
    });
  }

  void _saveWorkout() {
    if (_exercises.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please add at least one exercise.')),
      );
      return;
    }

    final newWorkout = Workout(
      id: DateTime.now().toString(),
      date: DateTime.now(),
      exercises: _exercises,
      notes: _notesController.text,
    );

    Provider.of<WorkoutProvider>(context, listen: false).addWorkout(newWorkout);
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log New Workout'),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: _saveWorkout,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Exercises', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 10),
            Expanded(
              child: _exercises.isEmpty
                  ? const Center(child: Text('Add exercises using the button below.'))
                  : ListView.builder(
                      itemCount: _exercises.length,
                      itemBuilder: (ctx, index) {
                        return _buildExerciseInputRow(index);
                      },
                    ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _notesController,
              decoration: const InputDecoration(
                labelText: 'Workout Notes',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                icon: const Icon(Icons.add),
                label: const Text('Add Exercise'),
                onPressed: _addExercise,
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                   side: BorderSide(color: Theme.of(context).colorScheme.primary),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExerciseInputRow(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: TextFormField(
              initialValue: _exercises[index].name,
              decoration: const InputDecoration(labelText: 'Exercise Name'),
              onChanged: (value) => _exercises[index].name = value,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: TextFormField(
              initialValue: _exercises[index].sets.toString(),
              decoration: const InputDecoration(labelText: 'Sets'),
              keyboardType: TextInputType.number,
              onChanged: (value) => _exercises[index].sets = int.tryParse(value) ?? 0,
            ),
          ),
           const SizedBox(width: 8),
          Expanded(
            child: TextFormField(
              initialValue: _exercises[index].reps.toString(),
              decoration: const InputDecoration(labelText: 'Reps'),
              keyboardType: TextInputType.number,
              onChanged: (value) => _exercises[index].reps = int.tryParse(value) ?? 0,
            ),
          ),
          IconButton(
            icon: Icon(Icons.delete, color: Theme.of(context).colorScheme.error),
            onPressed: () => _removeExercise(index),
          ),
        ],
      ),
    );
  }
}