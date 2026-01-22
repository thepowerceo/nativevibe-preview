import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flextrack_pro/models/exercise.dart';
import 'package:flextrack_pro/providers/workout_provider.dart';

class AddWorkoutScreen extends StatefulWidget {
  const AddWorkoutScreen({super.key});

  @override
  State<AddWorkoutScreen> createState() => _AddWorkoutScreenState();
}

class _AddWorkoutScreenState extends State<AddWorkoutScreen> {
  final _titleController = TextEditingController();
  final List<Exercise> _exercises = [];

  void _addNewExercise() {
    setState(() {
      _exercises.add(Exercise(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: '',
        sets: 0,
        reps: 0,
        weight: 0.0,
      ));
    });
  }

  void _saveWorkout() {
    if (_titleController.text.isEmpty || _exercises.isEmpty) return;
    Provider.of<WorkoutProvider>(context, listen: false).addWorkout(
      _titleController.text,
      _exercises,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Workout'),
        actions: [
          IconButton(onPressed: _saveWorkout, icon: const Icon(Icons.check))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Workout Title (e.g. Push Day)'),
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _exercises.length,
                itemBuilder: (ctx, i) => Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        TextField(
                          decoration: const InputDecoration(hintText: 'Exercise Name'),
                          onChanged: (val) => _exercises[i] = _exercises[i].copyWith(name: val),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                decoration: const InputDecoration(hintText: 'Sets'),
                                keyboardType: TextInputType.number,
                                onChanged: (val) => _exercises[i] = _exercises[i].copyWith(sets: int.tryParse(val) ?? 0),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: TextField(
                                decoration: const InputDecoration(hintText: 'Reps'),
                                keyboardType: TextInputType.number,
                                onChanged: (val) => _exercises[i] = _exercises[i].copyWith(reps: int.tryParse(val) ?? 0),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: TextField(
                                decoration: const InputDecoration(hintText: 'Kg'),
                                keyboardType: TextInputType.number,
                                onChanged: (val) => _exercises[i] = _exercises[i].copyWith(weight: double.tryParse(val) ?? 0.0),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            ElevatedButton.icon(
              onPressed: _addNewExercise,
              icon: const Icon(Icons.add),
              label: const Text('Add Exercise'),
            )
          ],
        ),
      ),
    );
  }
}