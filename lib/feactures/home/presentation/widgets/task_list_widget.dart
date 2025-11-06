import 'package:flutter/material.dart';

class TaskListWidget extends StatelessWidget {
  final List<String> tasks;

  const TaskListWidget({
    super.key,
    required this.tasks,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Tareas asignadas:',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2C2C2C),
            fontStyle: FontStyle.italic,
          ),
        ),
        const SizedBox(height: 4),
        ...tasks.map((task) => Padding(
          padding: const EdgeInsets.only(left: 8, top: 4),
          child: Text(
            task,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF2C2C2C),
              fontStyle: FontStyle.italic,
            ),
          ),
        )).toList(),
      ],
    );
  }
}