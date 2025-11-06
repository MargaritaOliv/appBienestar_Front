import 'package:flutter/material.dart';

class RegisterLink extends StatelessWidget {
  final VoidCallback onTap;

  const RegisterLink({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          '¿No tienes cuenta? ',
          style: TextStyle(
            fontSize: 14,
            color: Color(0xFF757575),
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: const Text(
            'Regístrate',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF8B7355),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}