import 'package:flutter/material.dart';

class AdminHeaderWithBack extends StatelessWidget {
  final String title;
  final VoidCallback? onMenuPressed;
  final VoidCallback? onBackPressed;

  const AdminHeaderWithBack({
    super.key,
    required this.title,
    this.onMenuPressed,
    this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header café con menú
        Container(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + 8,
            bottom: 12,
            left: 16,
            right: 16,
          ),
          decoration: const BoxDecoration(
            color: Color(0xFF8B7355),
          ),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                onPressed: onMenuPressed ?? () {
                  // TODO: Abrir drawer
                },
              ),
              const Expanded(
                child: Center(
                  child: Text(
                    'Bienestar integral',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 48), // Balance del IconButton
            ],
          ),
        ),

        // Barra de título con flecha atrás
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          color: Colors.white,
          child: Row(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Color(0xFF2C2C2C),
                ),
                onPressed: onBackPressed ?? () => Navigator.pop(context),
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2C2C2C),
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}