import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:fittrack/models/exercise.dart';
import 'package:fittrack/models/workout.dart';

/// Manages the state of workouts in the application.
///
/// This class uses the `ChangeNotifier` pattern to notify listeners of changes
/// to the workout data, simulating an offline-first data store.
class WorkoutProvider with ChangeNotifier {
  final List<Workout> _workouts = [
    // Initial dummy data for demonstration
    Workout(
      id: 'w1',
      name: 'Upper Body Day',
      date: DateTime.now().subtract(const Duration(days: 1)),
      exercises: [
        const Exercise(id: 'e1', name: 'Bench Press', sets: 3, reps: 8, weight: 60),
        const Exercise(id: 'e2', name: 'Pull Ups', sets: 3, reps: 10, weight: 0),
        const Exercise(id: 'e3', name: 'Overhead Press', sets: 3, reps: 8, weight: 40),
      ],
    ),
    Workout(
      id: 'w2',
      name: 'Leg Day',
      date: DateTime.now().subtract(const Duration(days: 3)),
      exercises: [
        const Exercise(id: 'e4', name: 'Squats', sets: 4, reps: 10, weight: 80),
        const Exercise(id: 'e5', name: 'Leg Press', sets: 3, reps: 12, weight: 120),
      ],
    ),
  ];

  /// An unmodifiable view of the list of workouts, sorted by most recent.
  UnmodifiableListView<Workout> get workouts => UnmodifiableListView(_workouts);

  /// Adds a new workout to the list.
  void addWorkout(String name) {
    final newWorkout = Workout(
      id: 'w${DateTime.now().millisecondsSinceEpoch}',
      name: name,
      date: DateTime.now(),
    );
    _workouts.insert(0, newWorkout);
    notifyListeners();
  }

  /// Adds an exercise to a specific workout.
  void addExerciseToWorkout(String workoutId, Exercise exercise) {
    try {
      final workoutIndex = _workouts.indexWhere((w) => w.id == workoutId);
      if (workoutIndex != -1) {
        _workouts[workoutIndex].exercises.add(exercise);
        notifyListeners();
      }
    } catch (e) {
      debugPrint("Error adding exercise: Workout with ID $workoutId not found.");
    }
  }
}