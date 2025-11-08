import 'package:flutter/material.dart';

class EventCardAdmin extends StatelessWidget {
  final String eventNumber;
  final String description;
  final String date;
  final String currentCount;
  final String maxCount;

  const EventCardAdmin({
    super.key,
    required this.eventNumber,
    required this.description,
    required this.date,
    required this.currentCount,
    required this.maxCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF9E28A), // Color de fondo amarillo
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Evento $eventNumber',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2C2C2C), // Texto oscuro
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '$currentCount/$maxCount',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF2C2C2C), // Texto oscuro
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'Descripción: $description',
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF2C2C2C), // Texto oscuro
              height: 1.5,
            ),
          ),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              'Fecha: $date',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF2C2C2C), // Texto oscuro
              ),
            ),
          ),
        ],
      ),
    );
  }
}