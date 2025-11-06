import 'package:flutter/material.dart';

class DaySelector extends StatelessWidget {
  final Map<String, bool> selectedDays;
  final Function(String) onDayToggle;

  const DaySelector({
    super.key,
    required this.selectedDays,
    required this.onDayToggle,
  });

  @override
  Widget build(BuildContext context) {
    final days = ['D', 'L', 'M', 'X', 'J', 'V', 'S'];
    final dayKeys = ['D', 'L', 'M', 'X', 'J', 'V', 'S'];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(days.length, (index) {
        final day = days[index];
        final dayKey = dayKeys[index];
        final isSelected = selectedDays[dayKey] ?? false;

        return GestureDetector(
          onTap: () => onDayToggle(dayKey),
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFF8B7355) : Colors.transparent,
              border: Border.all(
                color: isSelected ? const Color(0xFF8B7355) : Colors.grey.shade400,
                width: 1.5,
              ),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                day,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: isSelected ? Colors.white : Colors.grey.shade600,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}