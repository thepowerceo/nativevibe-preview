import 'package:flutter/foundation.dart';
import 'dart:collection';
import 'package:fit_track/models/workout_model.dart';

class WorkoutProvider extends ChangeNotifier {
  final List<Workout> _workouts = [
    Workout(
      name: 'Chest & Triceps Day',
      dateTime: DateTime.now().subtract(const Duration(days: 2)),
      exercises: [
        Exercise(name: 'Bench Press', sets: 4, reps: 8, weight: 80),
        Exercise(name: 'Incline Dumbbell Press', sets: 3, reps: 10, weight: 25),
        Exercise(name: 'Tricep Pushdown', sets: 3, reps: 12, weight: 20),
      ],
    ),
    Workout(
      name: 'Back & Biceps',
      dateTime: DateTime.now().subtract(const Duration(days: 4)),
      exercises: [
        Exercise(name: 'Deadlift', sets: 3, reps: 5, weight: 120),
        Exercise(name: 'Pull Ups', sets: 4, reps: 8, weight: 0),
        Exercise(name: 'Bicep Curls', sets: 3, reps: 10, weight: 15),
      ],
    ),
  ];

  UnmodifiableListView<Workout> get workouts => UnmodifiableListView(_workouts);

  void addWorkout(Workout workout) {
    _workouts.insert(0, workout);
    notifyListeners();
  }

  void removeWorkout(Workout workout) {
    _workouts.remove(workout);
    notifyListeners();
  }
}