import 'package:flutter/foundation.dart';
import 'package:fittrack/models/exercise.dart';
import 'package:fittrack/models/workout.dart';
import 'dart:collection';

/// Manages the state of workouts in the application.
///
/// This class acts as the single source of truth for workout data.
/// It follows an 'offline-first' approach by holding data in memory.
class WorkoutProvider with ChangeNotifier {
  final List<Workout> _workouts = [
    Workout(
      id: 'w1',
      name: 'Morning Chest & Triceps',
      date: DateTime.now().subtract(const Duration(days: 2)),
      exercises: [
        Exercise(id: 'e1', name: 'Bench Press', sets: 4, reps: 8, weight: 80),
        Exercise(id: 'e2', name: 'Incline Dumbbell Press', sets: 3, reps: 10, weight: 25),
        Exercise(id: 'e3', name: 'Tricep Dips', sets: 3, reps: 12, weight: 0),
      ],
    ),
    Workout(
      id: 'w2',
      name: 'Leg Day Annihilation',
      date: DateTime.now().subtract(const Duration(days: 4)),
      exercises: [
        Exercise(id: 'e4', name: 'Barbell Squats', sets: 5, reps: 5, weight: 100),
        Exercise(id: 'e5', name: 'Leg Press', sets: 4, reps: 10, weight: 150),
        Exercise(id: 'e6', name: 'Calf Raises', sets: 4, reps: 15, weight: 50),
      ],
    ),
  ];

  /// An unmodifiable view of the list of workouts, sorted by date.
  UnmodifiableListView<Workout> get workouts {
    _workouts.sort((a, b) => b.date.compareTo(a.date));
    return UnmodifiableListView(_workouts);
  }

  /// Adds a new workout to the list and notifies listeners.
  void addWorkout(Workout workout) {
    _workouts.add(workout);
    notifyListeners();
  }
}