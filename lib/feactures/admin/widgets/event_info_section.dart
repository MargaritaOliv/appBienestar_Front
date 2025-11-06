import 'package:flutter/material.dart';

class EventInfoSection extends StatelessWidget {
  final String description;
  final String dayName;
  final String dayNumber;
  final String monthYear;
  final String startTime;
  final String endTime;
  final String location;
  final int coordinators;
  final int volunteers;

  const EventInfoSection({
    super.key,
    required this.description,
    required this.dayName,
    required this.dayNumber,
    required this.monthYear,
    required this.startTime,
    required this.endTime,
    required this.location,
    required this.coordinators,
    required this.volunteers,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Descripción
          Text(
            description,
            style: const TextStyle(
              fontSize: 13,
              color: Color(0xFF2C2C2C),
              fontStyle: FontStyle.italic,
              height: 1.4,
            ),
          ),

          const SizedBox(height: 16),

          // Fecha y Hora
          Row(
            children: [
              // Card de Fecha
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Text(
                      dayName,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2C2C2C),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      dayNumber,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2C2C2C),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      monthYear,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF757575),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 16),

              // Horario
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'De $startTime',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF2C2C2C),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'a $endTime',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF2C2C2C),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),
          const Divider(height: 1),
          const SizedBox(height: 16),

          // Ubicación
          RichText(
            text: TextSpan(
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF2C2C2C),
                height: 1.5,
              ),
              children: [
                const TextSpan(
                  text: 'Donde:\n',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: location),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Capacidad
          RichText(
            text: TextSpan(
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF2C2C2C),
                height: 1.5,
              ),
              children: [
                const TextSpan(
                  text: 'Capacidad de voluntarios:\n',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: '$coordinators Coordinadores\n'),
                TextSpan(text: '$volunteers Voluntarios extras'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}