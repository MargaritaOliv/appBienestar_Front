import 'package:flutter/material.dart';

class LogoAvatar extends StatelessWidget {
  final double size;
  final String? imageUrl;
  final IconData? icon;

  const LogoAvatar({
    super.key,
    this.size = 120,
    this.imageUrl,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        color: Color(0xFFD9D9D9),
        shape: BoxShape.circle,
      ),
      child: imageUrl != null
          ? ClipOval(
        child: Image.network(
          imageUrl!,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return _buildDefaultIcon();
          },
        ),
      )
          : _buildDefaultIcon(),
    );
  }

  Widget _buildDefaultIcon() {
    return Icon(
      icon ?? Icons.person_outline,
      size: size * 0.5,
      color: Colors.white,
    );
  }
}