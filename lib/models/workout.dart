import 'package:fittrack/models/exercise.dart';

/// Represents a single workout session.
class Workout {
  /// Unique identifier for the workout.
  final String id;

  /// Name of the workout (e.g., "Chest Day").
  final String name;

  /// The date and time the workout was performed.
  final DateTime date;

  /// A list of exercises performed during this workout.
  final List<Exercise> exercises;

  /// Creates an instance of a [Workout].
  Workout({
    required this.id,
    required this.name,
    required this.date,
    List<Exercise>? exercises,
  }) : exercises = exercises ?? [];
}