import 'package:flutter/material.dart';

class SkillCheckboxItem extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool?> onChanged;

  const SkillCheckboxItem({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: CheckboxListTile(
        value: value,
        onChanged: onChanged,
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFF8B7355),
          ),
        ),
        activeColor: const Color(0xFF8B7355),
        checkboxShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        controlAffinity: ListTileControlAffinity.leading,
      ),
    );
  }
}