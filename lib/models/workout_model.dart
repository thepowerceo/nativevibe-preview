import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Exercise {
  final String id;
  final String name;
  final int sets;
  final int reps;
  final double weight;

  Exercise({
    required this.name,
    required this.sets,
    required this.reps,
    required this.weight,
  }) : id = uuid.v4();
}

class Workout {
  final String id;
  final String name;
  final DateTime dateTime;
  final List<Exercise> exercises;

  Workout({
    required this.name,
    required this.dateTime,
    required this.exercises,
  }) : id = uuid.v4();
}