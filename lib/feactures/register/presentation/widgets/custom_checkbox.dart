import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  final String label;
  final bool value;
  final Function(bool?) onChanged;
  final bool isTerms;

  const CustomCheckbox({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
    this.isTerms = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(!value),
      borderRadius: BorderRadius.circular(4),
      child: Row(
        children: [
          SizedBox(
            width: 24,
            height: 24,
            child: Checkbox(
              value: value,
              onChanged: onChanged,
              activeColor: const Color(0xFF8B7355),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              side: BorderSide(
                color: Colors.grey.shade400,
                width: 1.5,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                fontSize: isTerms ? 13 : 14,
                color: const Color(0xFF757575),
                fontWeight: isTerms ? FontWeight.w400 : FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}