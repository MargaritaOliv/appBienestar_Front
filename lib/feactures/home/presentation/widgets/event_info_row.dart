import 'package:flutter/material.dart';

class EventInfoRow extends StatelessWidget {
  final String label;
  final String value;

  const EventInfoRow({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFF2C2C2C),
          ),
          children: [
            TextSpan(
              text: '$label: ',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
            TextSpan(
              text: value,
              style: const TextStyle(
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}