import 'package:flutter/material.dart';

class Todos extends StatefulWidget {
  const Todos({super.key});

  @override
  State<Todos> createState() => _TodosState();
}

class _TodosState extends State<Todos> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Text("Hello world"),
      ),
    );
  }
}
