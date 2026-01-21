import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flavor_finder/providers/recipe_provider.dart';
import 'package:flavor_finder/widgets/recipe_card.dart';
import 'package:flavor_finder/screens/recipe_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            title: const Text('FlavorFinder', 
              style: TextStyle(fontWeight: FontWeight.bold)),
            floating: true,
            pinned: true,
            actions: [
              IconButton(icon: const Icon(Icons.favorite_border), onPressed: () {}),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SearchBar(
                hintText: 'Search by ingredients (e.g. Avocado)',
                leading: const Icon(Icons.search),
                onChanged: (value) => 
                  context.read<RecipeProvider>().updateSearch(value),
                padding: const WidgetStatePropertyAll(
                  EdgeInsets.symmetric(horizontal: 16.0)),
              ),
            ),
          ),
          Consumer<RecipeProvider>(
            builder: (context, provider, child) {
              final recipes = provider.filteredRecipes;
              if (recipes.isEmpty) {
                return const SliverFillRemaining(
                  child: Center(child: Text('No recipes found')),
                );
              }
              return SliverPadding(
                padding: const EdgeInsets.all(16),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.8,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => RecipeCard(recipe: recipes[index]),
                    childCount: recipes.length,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}