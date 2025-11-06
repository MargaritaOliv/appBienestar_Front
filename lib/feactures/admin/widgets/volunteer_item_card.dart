import 'package:flutter/material.dart';

class VolunteerItemCard extends StatelessWidget {
  final String name;
  final double reputation;
  final String? avatarUrl;
  final VoidCallback onViewProfile;
  final VoidCallback onAssignRole;

  const VolunteerItemCard({
    super.key,
    required this.name,
    required this.reputation,
    this.avatarUrl,
    required this.onViewProfile,
    required this.onAssignRole,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Avatar
          CircleAvatar(
            radius: 24,
            backgroundColor: const Color(0xFFD9D9D9),
            backgroundImage: avatarUrl != null && avatarUrl!.isNotEmpty
                ? NetworkImage(avatarUrl!)
                : null,
            child: avatarUrl == null || avatarUrl!.isEmpty
                ? Text(
              name.isNotEmpty ? name[0].toUpperCase() : '?',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            )
                : null,
          ),

          const SizedBox(width: 12),

          // Nombre y Reputación
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF2C2C2C),
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Text(
                      'Reputación:',
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xFF757575),
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(
                      Icons.star,
                      size: 16,
                      color: Color(0xFFFFC107),
                    ),
                    const SizedBox(width: 2),
                    Text(
                      reputation.toStringAsFixed(1),
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF2C2C2C),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(width: 8),

          // Botones
          Column(
            children: [
              // Botón Ver perfil
              ElevatedButton(
                onPressed: onViewProfile,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF8B7355),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 6,
                  ),
                  minimumSize: const Size(0, 0),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                child: const Text(
                  'Ver perfil',
                  style: TextStyle(fontSize: 12),
                ),
              ),

              const SizedBox(height: 6),

              // Botón Asignar cargo
              ElevatedButton(
                onPressed: onAssignRole,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF8B7355),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  minimumSize: const Size(0, 0),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                child: const Text(
                  'Asignar cargo',
                  style: TextStyle(fontSize: 11),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}