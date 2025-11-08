import 'package:flutter/material.dart';

class AdminBottomBar extends StatelessWidget {
  final VoidCallback onLaunchEvent;
  final VoidCallback onManageUsers;
  final VoidCallback onAddProduct;

  const AdminBottomBar({
    super.key,
    required this.onLaunchEvent,
    required this.onManageUsers,
    required this.onAddProduct,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _AdminBottomBarItem(
            icon: Icons.monetization_on_outlined, // Icono actualizado
            label: 'Lanzar\nevento',
            onTap: onLaunchEvent,
          ),
          _AdminBottomBarItem(
            icon: Icons.group_outlined, // Icono actualizado
            label: 'Gestionar\nusuarios',
            onTap: onManageUsers,
          ),
          _AdminBottomBarItem(
            icon: Icons.receipt_long_outlined, // Icono actualizado
            label: 'Ingresar\nproducto',
            onTap: onAddProduct,
          ),
        ],
      ),
    );
  }
}

// _AdminBottomBarItem (sin cambios, pero se incluye por completitud)
class _AdminBottomBarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _AdminBottomBarItem({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 28,
              color: const Color(0xFF2C2C2C),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF2C2C2C),
                height: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}