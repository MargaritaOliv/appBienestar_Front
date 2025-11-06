import 'package:flutter/material.dart';
import '../widgets/admin_header.dart';
import '../widgets/kitchen_info_card.dart';
import '../widgets/event_card_admin.dart';
import '../widgets/admin_bottom_bar.dart';
import 'package:bienesta_integral/core/route/app_routes.dart';

class HomeScreenAdmin extends StatefulWidget {
  const HomeScreenAdmin({super.key});

  @override
  State<HomeScreenAdmin> createState() => _HomeScreenAdminState();
}

class _HomeScreenAdminState extends State<HomeScreenAdmin> {
  // Datos de ejemplo - después conectar con tu backend
  final Map<String, String> _schedule = {
    'Lunes': '5:30 a.m.–5 p.m.',
    'martes': '5:30 a.m.–5 p.m.',
    'miercoles': '5:30 a.m.–5 p.m.',
    'jueves': '5:30 a.m.–5 p.m.',
    'Viernes': '5:30 a.m.–5 p.m.',
  };

  void _handleLaunchEvent() {
    // TODO: Navegar a la pantalla de lanzar evento
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Lanzar evento - Próximamente'),
        backgroundColor: Color(0xFF8B7355),
      ),
    );
  }

  // --- Función modificada aquí ---
  void _handleManageUsers() {
    // TODO: Navegar a la pantalla de gestionar usuarios
    // Reemplazando el SnackBar con la navegación
    Navigator.pushNamed(context, AppRoutes.manageVolunteers);
  }

  void _handleAddProduct() {
    // TODO: Navegar a la pantalla de ingresar producto
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Ingresar producto - Próximamente'),
        backgroundColor: Color(0xFF8B7355),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Column(
        children: [
          // Header sin SafeArea extra
          const AdminHeader(),

          // Contenido scrollable
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 8),

                  // Card de información de cocina
                  KitchenInfoCard(
                    title: 'Cocina integral',
                    subtitle: 'Calzada al sumidero Tuxtla Gtz.',
                    ownerName: 'Irving Champo',
                    imageUrl: 'https://images.unsplash.com/photo-1556911220-e15b29be8c8f?w=800',
                    schedule: _schedule,
                  ),

                  const SizedBox(height: 8),

                  // Card de evento
                  const EventCardAdmin(
                    eventNumber: '1',
                    description: 'Evento de donación de alimentos para familias necesitadas. Se requiere apoyo de voluntarios para la distribución.',
                    date: '24/12/2025',
                    currentCount: '0',
                    maxCount: '20',
                  ),

                  const SizedBox(height: 100), // Espacio para el bottom bar
                ],
              ),
            ),
          ),
        ],
      ),

      // Bottom navigation bar
      bottomNavigationBar: AdminBottomBar(
        onLaunchEvent: _handleLaunchEvent,
        onManageUsers: _handleManageUsers,
        onAddProduct: _handleAddProduct,
      ),
    );
  }
}