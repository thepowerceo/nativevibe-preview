class Recipe {
  final String id;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final int durationMinutes;
  final String difficulty;
  final List<String> instructions;
  bool isFavorite;

  Recipe({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.ingredients,
    required this.durationMinutes,
    required this.difficulty,
    required this.instructions,
    this.isFavorite = false,
  });
}