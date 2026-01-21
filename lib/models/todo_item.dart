enum TodoCategory {
  work, personal, shopping, health, urgent
}

class TodoItem {
  final String id;
  final String title;
  final String description;
  final DateTime dueDate;
  final TodoCategory category;
  bool isCompleted;

  TodoItem({
    String? id,
    required this.title,
    this.description = '',
    required this.dueDate,
    this.category = TodoCategory.personal,
    this.isCompleted = false,
  }) : id = id ?? DateTime.now().millisecondsSinceEpoch.toString();

  TodoItem copyWith({
    String? title,
    String? description,
    DateTime? dueDate,
    TodoCategory? category,
    bool? isCompleted,
  }) {
    return TodoItem(
      id: this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      dueDate: dueDate ?? this.dueDate,
      category: category ?? this.category,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}