import 'package:flutter/material.dart';
import 'package:fit_track/models/workout_model.dart';
import 'package:fit_track/services/workout_provider.dart';
import 'package:provider/provider.dart';

class AddWorkoutScreen extends StatefulWidget {
  const AddWorkoutScreen({super.key});

  @override
  State<AddWorkoutScreen> createState() => _AddWorkoutScreenState();
}

class _AddWorkoutScreenState extends State<AddWorkoutScreen> {
  final _formKey = GlobalKey<FormState>();
  final _workoutNameController = TextEditingController();
  final _exerciseNameController = TextEditingController();
  final _setsController = TextEditingController();
  final _repsController = TextEditingController();
  final _weightController = TextEditingController();

  final List<Exercise> _exercises = [];
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  void dispose() {
    _workoutNameController.dispose();
    _exerciseNameController.dispose();
    _setsController.dispose();
    _repsController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  void _addExercise() {
    if (_exerciseNameController.text.isNotEmpty &&
        _setsController.text.isNotEmpty &&
        _repsController.text.isNotEmpty &&
        _weightController.text.isNotEmpty) {
      final newExercise = Exercise(
        name: _exerciseNameController.text,
        sets: int.parse(_setsController.text),
        reps: int.parse(_repsController.text),
        weight: double.parse(_weightController.text),
      );
      setState(() {
        _exercises.insert(0, newExercise);
        _listKey.currentState?.insertItem(0, duration: const Duration(milliseconds: 300));
      });
      _exerciseNameController.clear();
      _setsController.clear();
      _repsController.clear();
      _weightController.clear();
      FocusScope.of(context).unfocus();
    }
  }


  void _saveWorkout() {
    if (_formKey.currentState!.validate() && _exercises.isNotEmpty) {
      final newWorkout = Workout(
        name: _workoutNameController.text,
        dateTime: DateTime.now(),
        exercises: _exercises,
      );
      Provider.of<WorkoutProvider>(context, listen: false).addWorkout(newWorkout);
      Navigator.of(context).pop();
    }
     else if (_exercises.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please add at least one exercise.'),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log New Workout'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: TextButton(
              onPressed: _saveWorkout,
              child: Text('SAVE', style: TextStyle(color: colorScheme.primary, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: _workoutNameController,
                decoration: const InputDecoration(
                  labelText: 'Workout Name (e.g., Leg Day)',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Please enter a workout name' : null,
              ),
            ),
            _buildAddExerciseForm(context),
            const Divider(height: 1),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Exercises (${_exercises.length})',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.grey[400]),
                ),
              ),
            ),
            Expanded(
              child: AnimatedList(
                key: _listKey,
                initialItemCount: _exercises.length,
                itemBuilder: (context, index, animation) {
                  final exercise = _exercises[index];
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(-1, 0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: ListTile(
                      title: Text(exercise.name),
                      subtitle: Text('${exercise.sets} sets x ${exercise.reps} reps @ ${exercise.weight} kg'),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
                        onPressed: () {
                          _listKey.currentState?.removeItem(
                            index,
                            (context, animation) => SizeTransition(
                              sizeFactor: animation,
                              child: const Card(child: ListTile(title: Text('Removing...'))),
                            ),
                            duration: const Duration(milliseconds: 300),
                          );
                          setState(() {
                            _exercises.removeAt(index);
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddExerciseForm(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Theme.of(context).cardTheme.color?.withOpacity(0.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Add Exercise', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 16),
          TextFormField(
            controller: _exerciseNameController,
            decoration: const InputDecoration(labelText: 'Exercise Name', border: UnderlineInputBorder()),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _setsController,
                  decoration: const InputDecoration(labelText: 'Sets', border: UnderlineInputBorder()),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: TextFormField(
                  controller: _repsController,
                  decoration: const InputDecoration(labelText: 'Reps', border: UnderlineInputBorder()),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: TextFormField(
                  controller: _weightController,
                  decoration: const InputDecoration(labelText: 'Weight (kg)', border: UnderlineInputBorder()),
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              icon: const Icon(Icons.add),
              label: const Text('Add Exercise'),
              onPressed: _addExercise,
              style: ElevatedButton.styleFrom(
                backgroundColor: colorScheme.primary,
                foregroundColor: colorScheme.onPrimary,
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}