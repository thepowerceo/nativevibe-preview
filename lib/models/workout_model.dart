import 'exercise_model.dart';

class Workout {
  final String id;
  final DateTime date;
  final List<Exercise> exercises;
  final String? notes;

  Workout({
    required this.id,
    required this.date,
    required this.exercises,
    this.notes,
  });
}