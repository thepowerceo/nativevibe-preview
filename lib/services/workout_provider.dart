import 'package:flutter/material.dart';
import 'dart:collection';

import 'package:vibrant_fit/models/workout_model.dart';

class WorkoutProvider with ChangeNotifier {
  final List<Workout> _workouts = [
    Workout(
      id: 'w1',
      name: 'Full Body Strength',
      date: DateTime.now().subtract(const Duration(days: 2)),
      exercises: [
        Exercise(id: 'e1', name: 'Squats', sets: 4, reps: 8, weight: 80.0),
        Exercise(id: 'e2', name: 'Bench Press', sets: 3, reps: 10, weight: 60.0),
        Exercise(id: 'e3', name: 'Deadlifts', sets: 3, reps: 6, weight: 100.0),
      ],
    ),
    Workout(
      id: 'w2',
      name: 'Cardio Day',
      date: DateTime.now().subtract(const Duration(days: 1)),
      exercises: [
        Exercise(id: 'e4', name: 'Treadmill Run (min)', sets: 1, reps: 1, weight: 30.0),
        Exercise(id: 'e5', name: 'Cycling (min)', sets: 1, reps: 1, weight: 20.0),
      ],
    ),
  ];

  UnmodifiableListView<Workout> get workouts => UnmodifiableListView(_workouts..sort((a,b) => b.date.compareTo(a.date)));

  void addWorkout(String name) {
    final newWorkout = Workout(
      id: DateTime.now().toIso8601String(),
      name: name,
      date: DateTime.now(),
    );
    _workouts.add(newWorkout);
    notifyListeners();
  }

  void deleteWorkout(String workoutId) {
    _workouts.removeWhere((workout) => workout.id == workoutId);
    notifyListeners();
  }
}