import 'package:flutter/material.dart';
import 'package:flextrack_pro/models/workout.dart';
import 'package:flextrack_pro/models/exercise.dart';

class WorkoutProvider with ChangeNotifier {
  final List<Workout> _workouts = [];

  List<Workout> get workouts => [..._workouts];

  void addWorkout(String title, List<Exercise> exercises) {
    final newWorkout = Workout(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      date: DateTime.now(),
      exercises: exercises,
    );
    _workouts.insert(0, newWorkout);
    notifyListeners();
  }

  void deleteWorkout(String id) {
    _workouts.removeWhere((w) => w.id == id);
    notifyListeners();
  }
}