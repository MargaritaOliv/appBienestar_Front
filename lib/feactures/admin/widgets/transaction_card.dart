import 'package:flutter/material.dart';
class TransactionCard extends StatelessWidget {
  final String title;
  final String date;
  final String source;
  final String amount;
  final bool isExpense; // Para determinar si es gasto (rojo) o ingreso (verde)

  const TransactionCard({
    super.key,
    required this.title,
    required this.date,
    required this.source,
    required this.amount,
    this.isExpense = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF8E1), // Un amarillo muy claro
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF9E28A).withOpacity(0.8)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Título, fecha y fuente
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2C2C2C),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '$date · $source',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF555555),
                ),
              ),
            ],
          ),
          // Monto
          Text(
            isExpense ? '-$amount' : '+$amount',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isExpense ? Colors.red : Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}