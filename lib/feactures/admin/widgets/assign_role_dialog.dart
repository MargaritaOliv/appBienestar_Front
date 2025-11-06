import 'package:flutter/material.dart';

class AssignRoleDialog extends StatefulWidget {
  final String volunteerName;

  const AssignRoleDialog({
    super.key,
    required this.volunteerName,
  });

  @override
  State<AssignRoleDialog> createState() => _AssignRoleDialogState();
}

class _AssignRoleDialogState extends State<AssignRoleDialog> {
  String? _selectedRole;

  final List<String> _roles = [
    'Coordinador',
    'Voluntario extra',
    'Apoyo logístico',
    'Atención al público',
  ];

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Título
            Text(
              'Asignar cargo',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2C2C2C),
              ),
            ),

            const SizedBox(height: 8),

            // Nombre del voluntario
            Text(
              'Para: ${widget.volunteerName}',
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF757575),
              ),
            ),

            const SizedBox(height: 24),

            // Lista de cargos
            ...(_roles.map((role) => RadioListTile<String>(
              title: Text(
                role,
                style: const TextStyle(fontSize: 14),
              ),
              value: role,
              groupValue: _selectedRole,
              activeColor: const Color(0xFF8B7355),
              contentPadding: EdgeInsets.zero,
              onChanged: (value) {
                setState(() {
                  _selectedRole = value;
                });
              },
            ))),

            const SizedBox(height: 24),

            // Botones
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Cancelar
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'Cancelar',
                    style: TextStyle(
                      color: Color(0xFF757575),
                    ),
                  ),
                ),

                const SizedBox(width: 12),

                // Asignar
                ElevatedButton(
                  onPressed: _selectedRole != null
                      ? () {
                    Navigator.pop(context, _selectedRole);
                  }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF8B7355),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Asignar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}