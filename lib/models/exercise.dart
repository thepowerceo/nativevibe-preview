/// Represents a single exercise within a workout.
class Exercise {
  /// Unique identifier for the exercise.
  final String id;

  /// Name of the exercise (e.g., "Bench Press").
  final String name;

  /// Number of sets performed.
  final int sets;

  /// Number of repetitions per set.
  final int reps;

  /// Weight used for the exercise in kilograms or pounds.
  final double weight;

  /// Creates an instance of an [Exercise].
  const Exercise({
    required this.id,
    required this.name,
    required this.sets,
    required this.reps,
    required this.weight,
  });
}