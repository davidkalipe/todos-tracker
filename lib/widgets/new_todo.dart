import 'package:flutter/material.dart';

import '../models/todo.dart';

class NewTodo extends StatefulWidget {
  const NewTodo({super.key, required this.onAddTodo});

  final void Function(Todo todo) onAddTodo;
  @override
  State<NewTodo> createState() => _NewTodoState();
}

class _NewTodoState extends State<NewTodo> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
