import 'dart:collection';
import 'package:flutter/material.dart';
import '../models/exercise_model.dart';
import '../models/workout_model.dart';

class WorkoutProvider with ChangeNotifier {
  final List<Workout> _workouts = [
    Workout(
      id: 'w1',
      date: DateTime.now().subtract(const Duration(days: 2)),
      exercises: [
        Exercise(id: 'e1', name: 'Bench Press', sets: 4, reps: 8),
        Exercise(id: 'e2', name: 'Squats', sets: 4, reps: 10),
        Exercise(id: 'e3', name: 'Deadlift', sets: 3, reps: 6),
      ],
      notes: 'Felt strong today. Good energy.',
    ),
    Workout(
      id: 'w2',
      date: DateTime.now().subtract(const Duration(days: 4)),
      exercises: [
        Exercise(id: 'e4', name: 'Overhead Press', sets: 3, reps: 8),
        Exercise(id: 'e5', name: 'Pull Ups', sets: 5, reps: 5),
        Exercise(id: 'e6', name: 'Barbell Rows', sets: 4, reps: 8),
      ],
    ),
  ];

  UnmodifiableListView<Workout> get workouts => UnmodifiableListView(_workouts);

  void addWorkout(Workout workout) {
    _workouts.insert(0, workout);
    notifyListeners();
  }

  void removeWorkout(String workoutId) {
    _workouts.removeWhere((workout) => workout.id == workoutId);
    notifyListeners();
  }
}