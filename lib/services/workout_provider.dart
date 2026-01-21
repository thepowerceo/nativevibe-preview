import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:fittrack/models/workout_model.dart';

class WorkoutProvider extends ChangeNotifier {
  final List<Workout> _workouts = [
    Workout(
      id: 'w1',
      name: 'Morning Run',
      date: DateTime.now().subtract(const Duration(days: 2)),
      durationInMinutes: 30,
    ),
    Workout(
      id: 'w2',
      name: 'Weight Lifting',
      date: DateTime.now().subtract(const Duration(days: 1)),
      durationInMinutes: 60,
    ),
    Workout(
      id: 'w3',
      name: 'Yoga Session',
      date: DateTime.now(),
      durationInMinutes: 45,
    ),
  ];

  UnmodifiableListView<Workout> get workouts {
    _workouts.sort((a, b) => b.date.compareTo(a.date));
    return UnmodifiableListView(_workouts);
  }

  void addWorkout(String name, int duration) {
    final newWorkout = Workout(
      id: DateTime.now().toIso8601String(),
      name: name,
      date: DateTime.now(),
      durationInMinutes: duration,
    );
    _workouts.add(newWorkout);
    notifyListeners();
  }

  void removeWorkout(String id) {
    _workouts.removeWhere((workout) => workout.id == id);
    notifyListeners();
  }
}