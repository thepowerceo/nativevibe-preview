class Exercise {
  final String id;
  final String name;
  final int sets;
  final int reps;
  final double weight;

  Exercise({
    required this.id,
    required this.name,
    required this.sets,
    required this.reps,
    required this.weight,
  });

  Exercise copyWith({
    String? name,
    int? sets,
    int? reps,
    double? weight,
  }) {
    return Exercise(
      id: this.id,
      name: name ?? this.name,
      sets: sets ?? this.sets,
      reps: reps ?? this.reps,
      weight: weight ?? this.weight,
    );
  }
}