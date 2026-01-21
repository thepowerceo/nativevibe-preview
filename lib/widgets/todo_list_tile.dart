import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:zentask/models/todo_item.dart';
import 'package:zentask/providers/todo_provider.dart';

class TodoListTile extends StatelessWidget {
  final TodoItem todo;

  const TodoListTile({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Dismissible(
      key: Key(todo.id),
      direction: DismissDirection.endToStart,
      background:
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 20),
            color: Colors.redAccent,
            child: const Icon(Icons.delete, color: Colors.white),
          ),
      onDismissed: (_)
          => context.read<TodoProvider>().deleteTodo(todo.id),
      child:
          Card(
            margin: const EdgeInsets.only(bottom: 12),
            elevation: 0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12), side: BorderSide(color: colorScheme.outlineVariant)),
            child:
                ListTile(
                  leading:
                      Checkbox(
                        activeColor: colorScheme.primary,
                        value: todo.isCompleted,
                        onChanged: (_)
                            => context.read<TodoProvider>().toggleStatus(todo.id),
                        shape: const CircleBorder(),
                      ),
                  title:
                      Text(
                        todo.title,
                        style:
                            TextStyle(
                              decoration: todo.isCompleted ? TextDecoration.lineThrough : null,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                  subtitle:
                      Row(
                        children: [
                          Text(
                            DateFormat('MMM d').format(todo.dueDate),
                            style: TextStyle(fontSize: 12, color: colorScheme.primary),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration:
                                BoxDecoration(
                                  color: colorScheme.secondaryContainer,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                            child:
                                Text(
                                  todo.category.name,
                                  style:
                                      TextStyle(fontSize: 10, color: colorScheme.onSecondaryContainer),
                                ),
                          ),
                        ],
                      ),
                ),
          ),
    );
  }
}