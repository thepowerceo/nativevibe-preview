import 'package:fittrack/models/exercise.dart';

/// Represents a single workout session.
class Workout {
  /// A unique identifier for the workout.
  final String id;

  /// The name or type of the workout (e.g., 'Chest Day').
  final String name;

  /// The date and time the workout was performed.
  final DateTime date;

  /// The total duration of the workout in minutes.
  final int durationInMinutes;

  /// A list of exercises performed during the workout.
  final List<Exercise> exercises;

  /// Creates an instance of [Workout].
  Workout({
    required this.id,
    required this.name,
    required this.date,
    required this.durationInMinutes,
    required this.exercises,
  });
}