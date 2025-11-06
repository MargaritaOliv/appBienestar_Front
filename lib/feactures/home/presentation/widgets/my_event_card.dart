import 'package:flutter/material.dart';
import 'event_info_row.dart';
import 'task_list_widget.dart';

class MyEventCard extends StatelessWidget {
  final String eventName;
  final String date;
  final String time;
  final String location;
  final List<String> tasks;
  final VoidCallback onMarkComplete;

  const MyEventCard({
    super.key,
    required this.eventName,
    required this.date,
    required this.time,
    required this.location,
    required this.tasks,
    required this.onMarkComplete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF8E1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFF8B7355).withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          EventInfoRow(
            label: 'Evento',
            value: eventName,
          ),

          EventInfoRow(
            label: 'Fecha',
            value: date,
          ),

          EventInfoRow(
            label: 'Hora',
            value: time,
          ),

          EventInfoRow(
            label: 'Lugar',
            value: location,
          ),

          const SizedBox(height: 4),


          TaskListWidget(tasks: tasks),

          const SizedBox(height: 16),


          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onMarkComplete,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF8B7355),
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
              ),
              child: const Text(
                'Marcar tarea como completada',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}