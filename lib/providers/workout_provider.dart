import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:fittrack/models/exercise.dart';
import 'package:fittrack/models/workout.dart';

/// Manages the state of the user's workouts.
class WorkoutProvider with ChangeNotifier {
  final List<Workout> _workouts = [
    Workout(
      id: 'w1',
      name: 'Morning Run',
      date: DateTime.now().subtract(const Duration(days: 2)),
      durationInMinutes: 30,
      exercises: [],
    ),
    Workout(
      id: 'w2',
      name: 'Full Body Strength',
      date: DateTime.now().subtract(const Duration(days: 1)),
      durationInMinutes: 65,
      exercises: [
        Exercise(id: 'e1', name: 'Squats', sets: 3, reps: 10, weightInKg: 60),
        Exercise(id: 'e2', name: 'Bench Press', sets: 3, reps: 8, weightInKg: 50),
        Exercise(id: 'e3', name: 'Deadlift', sets: 1, reps: 5, weightInKg: 100),
      ],
    ),
  ];

  /// An unmodifiable view of the list of workouts, sorted by date.
  UnmodifiableListView<Workout> get workouts {
    _workouts.sort((a, b) => b.date.compareTo(a.date));
    return UnmodifiableListView(_workouts);
  }

  /// Adds a new workout to the list.
  void addWorkout(Workout workout) {
    _workouts.add(workout);
    notifyListeners();
  }

  /// Finds a workout by its ID.
  Workout findById(String id) {
    return _workouts.firstWhere((w) => w.id == id);
  }
}