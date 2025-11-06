import 'package:flutter/material.dart';

class ThemeDialog extends StatelessWidget {
  final String currentTheme;
  final ValueChanged<String> onThemeSelected;

  const ThemeDialog({
    super.key,
    required this.currentTheme,
    required this.onThemeSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Elegir tema',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF8B7355),
              ),
            ),
            const SizedBox(height: 20),
            _ThemeOption(
              title: 'Claro',
              icon: Icons.light_mode,
              isSelected: currentTheme == 'light',
              onTap: () {
                onThemeSelected('light');
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 12),
            _ThemeOption(
              title: 'Oscuro',
              icon: Icons.dark_mode,
              isSelected: currentTheme == 'dark',
              onTap: () {
                onThemeSelected('dark');
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 12),
            _ThemeOption(
              title: 'Sistema',
              icon: Icons.settings_suggest,
              isSelected: currentTheme == 'system',
              onTap: () {
                onThemeSelected('system');
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _ThemeOption extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _ThemeOption({
    required this.title,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFF8B7355).withOpacity(0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? const Color(0xFF8B7355)
                : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected
                  ? const Color(0xFF8B7355)
                  : Colors.grey.shade600,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                  color: isSelected
                      ? const Color(0xFF8B7355)
                      : const Color(0xFF2C2C2C),
                ),
              ),
            ),
            if (isSelected)
              const Icon(
                Icons.check_circle,
                color: Color(0xFF8B7355),
              ),
          ],
        ),
      ),
    );
  }
}