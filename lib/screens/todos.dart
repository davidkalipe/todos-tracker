import 'package:flutter/material.dart';
import 'package:todo_tracker/widgets/new_todo.dart';
import 'package:todo_tracker/widgets/todo_list.dart';

import '../models/todo.dart';

class Todos extends StatefulWidget {
  const Todos({super.key});

  @override
  State<Todos> createState() => _TodosState();
}

class _TodosState extends State<Todos> {
  final List<Todo> _registeredTodos = [
    Todo(
        title: "Ménage",
        description: "Faire le ménage dans ma chambre",
        category: Category.other,
        done: false,
        finishedDate: DateTime.now()),
    Todo(
        title: "Bosser",
        description: "Passer des cours en ligne",
        category: Category.work,
        done: false,
        finishedDate: DateTime.now()),
  ];

  void _removeTodo(Todo todo) {
    final todoIndex = _registeredTodos.indexOf(todo);

    setState(() {
      _registeredTodos.remove(todo);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 3),
      content: Text("Todo ${todo.title} removed"),
      action: SnackBarAction(
        label: "Undo",
        onPressed: () {
          setState(() {
            _registeredTodos.insert(todoIndex, todo);
          });
        },
      ),
    ));
  }

  _addTodo(Todo todo) {
    setState(() {
      _registeredTodos.add(todo);
    });
  }

  _openAddTodoOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => NewTodo(
        onAddTodo: _addTodo,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text("No todos found"),
    );

    if (_registeredTodos.isNotEmpty) {
      mainContent =
          TodosList(todos: _registeredTodos, onRemovedTodo: _removeTodo);
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: const Text("Todos tracker"),
        actions: [
          IconButton(
            onPressed: _openAddTodoOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: mainContent,
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(200, 216, 223, 194),
    );
  }
}
