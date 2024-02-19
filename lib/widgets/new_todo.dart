import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/todo.dart';

class NewTodo extends StatefulWidget {
  const NewTodo({super.key, required this.onAddTodo});

  final void Function(Todo todo) onAddTodo;

  @override
  State<NewTodo> createState() => _NewTodoState();
}

class _NewTodoState extends State<NewTodo> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  DateTime? _selectedFinishedDate;
  Category _selectedCategory = Category.work;

  void _presentDatePicker() async {
    final now = DateTime.now();
    final first = DateTime(now.year - 1, now.month + 3);

    final pickedDate = await showDatePicker(
        context: context, initialDate: now, firstDate: first, lastDate: now);

    setState(() {
      _selectedFinishedDate = pickedDate;
    });
  }

  void _submitTodoData() {
    if (_titleController.text.trim().isEmpty ||
        _descriptionController.text.trim().isEmpty ||
        _selectedFinishedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("Invalid input"),
          content: const Text("Verify your inputs"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: const Text("Ok"),
            ),
          ],
        ),
      );
      return;
    }

    widget.onAddTodo(
      Todo(
          title: _titleController.text,
          description: _descriptionController.text,
          done: DateTime.now().isAfter(_selectedFinishedDate!) ? true : false,
          finishedDate: _selectedFinishedDate!,
          category: _selectedCategory),
    );
    Navigator.of(context).pop;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1500,
      child: Container(
        padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
            ),
            const Gap(10),
            Row(
              children: [
                Text(
                  _selectedFinishedDate == null
                      ? "No date selected"
                      : formatter.format(_selectedFinishedDate!),
                ),
                IconButton(
                    icon: const Icon(Icons.date_range_outlined),
                    onPressed: _presentDatePicker),
                const Spacer(),
                DropdownButton(
                    value: _selectedCategory,
                    items: Category.values
                        .map((category) => DropdownMenuItem(
                              value: category,
                              child: Text(
                                category.name.toUpperCase(),
                                style: GoogleFonts.lato(),
                              ),
                            ))
                        .toList(),
                    onChanged: (value) {
                      if (value == null) {
                        return;
                      }
                      setState(() {
                        _selectedCategory = value;
                      });
                    }),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _descriptionController,
                    maxLength: 100,
                    decoration: const InputDecoration(
                      labelText: 'Description',
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    _descriptionController.clear();
                  },
                  icon: const Icon(Icons.clear_rounded),
                ),
                const SizedBox(width: 5),
              ],
            ),
            const Gap(15),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Cancel",
                    style: GoogleFonts.lato(color: Colors.black, fontSize: 18),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(
                          Color.fromARGB(150, 100, 50, 20))),
                  onPressed: _submitTodoData,
                  child: Text(
                    "Save todo",
                    style: GoogleFonts.lato(),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
