import 'package:flutter/material.dart';
import 'package:flavor_finder/models/recipe.dart';

class RecipeProvider with ChangeNotifier {
  final List<Recipe> _recipes = [
    Recipe(
      id: '1',
      title: 'Avocado Toast Deluxe',
      imageUrl: 'https://images.unsplash.com/photo-1525351484163-7529414344d8?w=500',
      ingredients: ['Avocado', 'Bread', 'Egg', 'Chili Flakes'],
      durationMinutes: 15,
      difficulty: 'Easy',
      instructions: ['Toast the bread', 'Mash avocado', 'Fry an egg', 'Assemble and season'],
    ),
    Recipe(
      id: '2',
      title: 'Berry Smoothie Bowl',
      imageUrl: 'https://images.unsplash.com/photo-1494597564530-801f358e3356?w=500',
      ingredients: ['Blueberries', 'Banana', 'Yogurt', 'Granola'],
      durationMinutes: 10,
      difficulty: 'Easy',
      instructions: ['Blend fruits and yogurt', 'Pour into bowl', 'Top with granola'],
    ),
    Recipe(
      id: '3',
      title: 'Quinoa Salad',
      imageUrl: 'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=500',
      ingredients: ['Quinoa', 'Cucumber', 'Tomato', 'Lemon'],
      durationMinutes: 25,
      difficulty: 'Medium',
      instructions: ['Cook quinoa', 'Chop vegetables', 'Mix with dressing'],
    ),
  ];

  String _searchQuery = '';
  
  List<Recipe> get filteredRecipes {
    if (_searchQuery.isEmpty) return _recipes;
    return _recipes.where((recipe) {
      return recipe.ingredients.any((i) => 
        i.toLowerCase().contains(_searchQuery.toLowerCase())) ||
        recipe.title.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();
  }

  void updateSearch(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  void toggleFavorite(String id) {
    final index = _recipes.indexWhere((r) => r.id == id);
    if (index != -1) {
      _recipes[index].isFavorite = !_recipes[index].isFavorite;
      notifyListeners();
    }
  }
}