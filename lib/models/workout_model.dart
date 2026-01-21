class Exercise {
  final String id;
  final String name;
  int sets;
  int reps;
  double weight;

  Exercise({
    required this.id,
    required this.name,
    this.sets = 3,
    this.reps = 10,
    this.weight = 0.0,
  });
}

class Workout {
  final String id;
  final String name;
  final DateTime date;
  final List<Exercise> exercises;

  Workout({
    required this.id,
    required this.name,
    required this.date,
    List<Exercise>? exercises,
  }) : exercises = exercises ?? [];
}