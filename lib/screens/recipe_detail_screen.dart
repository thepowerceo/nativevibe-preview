import 'package:flutter/material.dart';
import 'package:flavor_finder/models/recipe.dart';

class RecipeDetailScreen extends StatelessWidget {
  final Recipe recipe;

  const RecipeDetailScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(recipe.imageUrl, fit: BoxFit.cover),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(recipe.title, style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      _InfoChip(icon: Icons.timer, label: '${recipe.durationMinutes}m'),
                      const SizedBox(width: 12),
                      _InfoChip(icon: Icons.bolt, label: recipe.difficulty),
                    ],
                  ),
                  const SizedBox(height: 32),
                  Text('Ingredients', style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 12),
                  ...recipe.ingredients.map((ing) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(children: [
                      Icon(Icons.check_circle_outline, size: 18, color: Theme.of(context).primaryColor),
                      const SizedBox(width: 8),
                      Text(ing),
                    ]),
                  )),
                  const SizedBox(height: 32),
                  Text('Instructions', style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 12),
                  ...recipe.instructions.asMap().entries.map((entry) => Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Text('${entry.key + 1}. ${entry.value}'),
                  )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;
  const _InfoChip({required this.icon, required this.label});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, size: 16),
          const SizedBox(width: 4),
          Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}