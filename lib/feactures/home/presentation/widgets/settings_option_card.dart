import 'package:flutter/material.dart';

class SettingsOptionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final VoidCallback onTap;
  final Widget? trailing;

  const SettingsOptionCard({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
    required this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
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
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0xFF8B7355).withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            icon,
            color: const Color(0xFF8B7355),
            size: 24,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Color(0xFF2C2C2C),
          ),
        ),
        subtitle: subtitle != null
            ? Text(
          subtitle!,
          style: const TextStyle(
            fontSize: 13,
            color: Color(0xFF757575),
          ),
        )
            : null,
        trailing: trailing ??
            const Icon(
              Icons.chevron_right,
              color: Color(0xFF8B7355),
            ),
      ),
    );
  }
}