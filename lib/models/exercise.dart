/// Represents a single exercise within a workout.
class Exercise {
  /// A unique identifier for the exercise.
  final String id;

  /// The name of the exercise (e.g., 'Bench Press').
  final String name;

  /// The number of sets performed.
  final int sets;

  /// The number of repetitions per set.
  final int reps;

  /// The weight used for the exercise in kilograms.
  final double weightInKg;

  /// Creates an instance of [Exercise].
  const Exercise({
    required this.id,
    required this.name,
    required this.sets,
    required this.reps,
    required this.weightInKg,
  });
}