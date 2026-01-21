import 'package:fittrack/models/exercise.dart';

/// Represents a complete workout session.
class Workout {
  /// A unique identifier for the workout.
  final String id;

  /// The name or type of the workout (e.g., 'Chest Day', 'Leg Day').
  final String name;

  /// The date the workout was performed.
  final DateTime date;

  /// The list of exercises performed during this workout.
  final List<Exercise> exercises;

  const Workout({
    required this.id,
    required this.name,
    required this.date,
    required this.exercises,
  });

  /// Calculates the total duration of the workout based on exercises.
  /// A simple estimation.
  int get durationInMinutes => (exercises.length * 5).round();

  /// Calculates the total volume (sets * reps * weight) for the workout.
  double get totalVolume {
    return exercises.fold(
      0.0,
      (sum, exercise) => sum + (exercise.sets * exercise.reps * exercise.weight),
    );
  }
}