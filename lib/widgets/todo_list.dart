import 'package:flutter/material.dart';
import 'package:todo_tracker/widgets/todo_item.dart';

import '../models/todo.dart';

class TodosList extends StatelessWidget {
  const TodosList(
      {super.key, required this.todos, required this.onRemovedTodo});

  final List<Todo> todos;
  final void Function(Todo todo) onRemovedTodo;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(5),
        itemCount: todos.length,
        itemBuilder: (ctx, index) => Dismissible(
            key: ValueKey(todos[index]),
            onDismissed: (direction) => onRemovedTodo(todos[index]),
            child: TodoItem(
              todos[index],
            )));
  }
}
