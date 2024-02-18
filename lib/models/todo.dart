
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

final formatter = DateFormat.yMd();

enum Category{work, leisure, other}

const categoryIcons = {
  Category.work: Icons.work,
  Category.leisure: Icons.movie_creation_outlined,
  Category.other: Icons.devices_other,
};

class Todo{
  Todo({required this.title, required this.description, required this.category, required this.finishedDate, required this.done})
  : id = uuid.v4();

  final String id;
  final String title;
  final String description;
  final Category category;
  final DateTime finishedDate;
  final bool done;

  String get formatDate{
    return formatter.format(finishedDate);
  }
}