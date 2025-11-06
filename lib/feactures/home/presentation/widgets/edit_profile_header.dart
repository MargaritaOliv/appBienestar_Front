import 'package:flutter/material.dart';

class EditProfileHeader extends StatelessWidget {
  final VoidCallback onCameraPressed;
  final String? photoUrl;

  const EditProfileHeader({
    super.key,
    required this.onCameraPressed,
    this.photoUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 20),
      decoration: const BoxDecoration(
        color: Color(0xFF8B7355),
      ),
      child: Column(
        children: [
          // Avatar editable
          Stack(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.white,
                backgroundImage: photoUrl != null ? NetworkImage(photoUrl!) : null,
                child: photoUrl == null
                    ? const Icon(
                  Icons.person,
                  size: 60,
                  color: Color(0xFF8B7355),
                )
                    : null,
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: GestureDetector(
                  onTap: onCameraPressed,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.camera_alt,
                      size: 20,
                      color: Color(0xFF8B7355),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            'Editar perfil',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Actualiza tu información',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white70,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}