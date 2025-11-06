import 'package:flutter/material.dart';

class ForgotPasswordLink extends StatelessWidget {
  final VoidCallback onTap;

  const ForgotPasswordLink({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        ),
        child: const Text(
          '¿Olvidaste tu contraseña?',
          style: TextStyle(
            fontSize: 13,
            color: Color(0xFF8B7355),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}