import 'package:flutter/material.dart';
import '../widgets/event_info_section.dart';
import '../widgets/volunteer_item_card.dart';
import '../widgets/assign_role_dialog.dart';

class ManageVolunteersScreen extends StatefulWidget {
  const ManageVolunteersScreen({super.key});

  @override
  State<ManageVolunteersScreen> createState() => _ManageVolunteersScreenState();
}

class _ManageVolunteersScreenState extends State<ManageVolunteersScreen> {
  // Datos de ejemplo - después conectar con backend
  final List<Map<String, dynamic>> _volunteers = [
    {
      'name': 'Didier Mendoza',
      'reputation': 4.8,
      'avatarUrl': '',
    },
    {
      'name': 'Irving Champo',
      'reputation': 5.0,
      'avatarUrl': '',
    },
    {
      'name': 'Brandon Gómez',
      'reputation': 2.8,
      'avatarUrl': '',
    },
    {
      'name': 'Margarita Olivera',
      'reputation': 4.9,
      'avatarUrl': '',
    },
  ];

  void _handleViewProfile(String name) {
    // TODO: Navegar al perfil del voluntario
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Ver perfil de $name'),
        backgroundColor: const Color(0xFF8B7355),
      ),
    );
  }

  void _handleAssignRole(String name) async {
    final selectedRole = await showDialog<String>(
      context: context,
      builder: (context) => AssignRoleDialog(volunteerName: name),
    );

    if (selectedRole != null && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('$name asignado como $selectedRole'),
          backgroundColor: const Color(0xFF8B7355),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Column(
        children: [
          // Header café con menú
          Container(
            padding: const EdgeInsets.only(
              bottom: 12,
              left: 16,
              right: 16,
            ),
            decoration: const BoxDecoration(
              color: Color(0xFF8B7355),
            ),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    // TODO: Abrir drawer
                  },
                ),
                const Expanded(
                  child: Center(
                    child: Text(
                      'Bienestar integral',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 48), // Balance del IconButton
              ],
            ),
          ),

          // Barra de título con flecha atrás
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            color: Colors.white,
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Color(0xFF2C2C2C),
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
                const SizedBox(width: 8),
                const Text(
                  'Gestión de voluntarios',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2C2C2C),
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),

          // Contenido scrollable
          Expanded(
            child: ListView(
              children: [
                // Información del evento
                const EventInfoSection(
                  description: 'Este evento va dirigido a personas indigentes por las fechas navideñas',
                  dayName: 'Domingo',
                  dayNumber: '03',
                  monthYear: 'Oct/2026',
                  startTime: '02:30 pm',
                  endTime: '5:00pm',
                  location: 'Calzada al sumidero al bahía baja, enfrente bodega aurrera',
                  coordinators: 2,
                  volunteers: 13,
                ),

                const SizedBox(height: 8),

                // Lista de voluntarios
                ..._volunteers.map((volunteer) => VolunteerItemCard(
                  name: volunteer['name'],
                  reputation: volunteer['reputation'],
                  avatarUrl: volunteer['avatarUrl'],
                  onViewProfile: () => _handleViewProfile(volunteer['name']),
                  onAssignRole: () => _handleAssignRole(volunteer['name']),
                )).toList(),

                const SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}