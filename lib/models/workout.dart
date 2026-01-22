import 'package:flextrack_pro/models/exercise.dart';

class Workout {
  final String id;
  final String title;
  final DateTime date;
  final List<Exercise> exercises;

  Workout({
    required this.id,
    required this.title,
    required this.date,
    required this.exercises,
  });

  double get totalVolume {
    return exercises.fold(0, (sum, item) => sum + (item.sets * item.reps * item.weight));
  }
}