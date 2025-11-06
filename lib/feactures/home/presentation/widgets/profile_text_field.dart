import 'package:flutter/material.dart';

class ProfileTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String hintText;
  final bool isRequired;
  final IconData icon;

  const ProfileTextField({
    super.key,
    required this.label,
    required this.controller,
    required this.hintText,
    this.isRequired = true,
    this.icon = Icons.person,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xFF8B7355),
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            prefixIcon: Icon(
              icon,
              color: Color(0xFF8B7355),
            ),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Color(0xFFBDBDBD),
              fontSize: 14,
            ),
          ),
          validator: isRequired
              ? (value) {
            if (value == null || value.isEmpty) {
              return 'Por favor completa este campo';
            }
            return null;
          }
              : null,
        ),
      ],
    );
  }
}