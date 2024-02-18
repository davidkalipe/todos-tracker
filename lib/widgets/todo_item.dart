import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/todo.dart';

class TodoItem extends StatelessWidget {
  const TodoItem(this.todo, {super.key});

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.black87,
      margin: const EdgeInsets.all(10),
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    todo.title,
                    style: GoogleFonts.lato(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  Text(
                    todo.formatDate.toString(),
                    style: GoogleFonts.lato(
                        color: const Color.fromARGB(200, 150, 100, 40)),
                  ),
                ],
              ),
              const Gap(10),
              Row(
                children: [
                  Text(
                    todo.description,
                    style: GoogleFonts.lato(fontSize: 18),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Icon(
                        categoryIcons[todo.category],
                      ),
                      const SizedBox(width: 15),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
