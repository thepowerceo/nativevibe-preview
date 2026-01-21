import 'package:flutter/material.dart';
import 'package:zentask/models/todo_item.dart';

class TodoProvider with ChangeNotifier {
  final List<TodoItem> _items = [];

  List<TodoItem> get items => [..._items];
  
  List<TodoItem> get pendingItems => _items.where((item) => !item.isCompleted).toList();
  List<TodoItem> get completedItems => _items.where((item) => item.isCompleted).toList();

  void addTodo(TodoItem item) {
    _items.add(item);
    _notify();
  }

  void toggleStatus(String id) {
    final index = _items.indexWhere((item) => item.id == id);
    if (index != -1) {
      _items[index].isCompleted = !_items[index].isCompleted;
      _notify();
    }
  }

  void deleteTodo(String id) {
    _items.removeWhere((item) => item.id == id);
    _notify();
  }

  void _notify() {
    // In a real app, logic to save to local storage (SharedPreferences/SQFlite) would go here
    notifyListeners();
  }
}