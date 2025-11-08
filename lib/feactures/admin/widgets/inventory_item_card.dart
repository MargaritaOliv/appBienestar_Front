import 'package:flutter/material.dart';

class InventoryItemCard extends StatelessWidget {
  final String name;
  final String quantity;
  final String status;

  const InventoryItemCard({
    super.key,
    required this.name,
    required this.quantity,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF8E1), // Un amarillo muy claro
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF9E28A)), // Borde amarillo
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Nombre y Cantidad
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2C2C2C),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Cantidad: $quantity',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF555555),
                ),
              ),
            ],
          ),
          // Estado
          Text(
            status,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2C2C2C),
            ),
          ),
        ],
      ),
    );
  }
}