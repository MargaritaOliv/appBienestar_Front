import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  const LoginHeader({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2C2C2C),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          subtitle,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFF757575),
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}