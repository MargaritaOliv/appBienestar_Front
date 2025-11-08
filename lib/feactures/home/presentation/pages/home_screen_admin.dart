import 'package:flutter/material.dart';
import '../widgets/admin_drawer.dart'; // Importa el nuevo Drawer
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
  // Datos de ejemplo
  final Map<String, String> _schedule = {
    'Lunes': '5:30 a.m.–5 p.m.',
    'martes': '5:30 a.m.–5 p.m.',
    'miercoles': '5:30 a.m.–5 p.m.',
    'jueves': '5:30 a.m.–5 p.m.',
    'Viernes': '5:30 a.m.–5 p.m.',
  };

  void _handleLaunchEvent() {
    Navigator.pushNamed(context, AppRoutes.launchEvent);
  }

  void _handleManageUsers() {
    Navigator.pushNamed(context, AppRoutes.manageVolunteers);
  }

  void _handleAddProduct() {
    Navigator.pushNamed(context, AppRoutes.addProduct);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Nuevo AppBar que coincide con el diseño amarillo
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9E28A), // Color amarillo
        elevation: 0,
        title: const Text(
          'Bienestar integral',
          style: TextStyle(
            color: Color(0xFF2C2C2C), // Texto oscuro
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Color(0xFF2C2C2C)), // Icono de menú oscuro
      ),

      // Nuevo Drawer (menú lateral)
      drawer: const AdminDrawer(),

      backgroundColor: Colors.white, // Fondo blanco para el contenido
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 8),

            // Card de información de cocina (sin cambios en su lógica)
            KitchenInfoCard(
              title: 'Cocina integral',
              subtitle: 'Calzada al sumidero Tuxtla Gtz.',
              ownerName: 'Irving Champo',
              imageUrl: 'https://images.unsplash.com/photo-1556911220-e15b29be8c8f?w=800',
              schedule: _schedule,
            ),

            const SizedBox(height: 8),

            // Card de evento (actualizada con el nuevo color)
            const EventCardAdmin(
              eventNumber: '1',
              description: '--------------------------------------------------',
              date: '24/12/2025',
              currentCount: '0',
              maxCount: '20',
            ),
          ],
        ),
      ),

      // Bottom navigation bar (con iconos actualizados)
      bottomNavigationBar: AdminBottomBar(
        onLaunchEvent: _handleLaunchEvent,
        onManageUsers: _handleManageUsers,
        onAddProduct: _handleAddProduct,
      ),
    );
  }
}