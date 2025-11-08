import 'package:flutter/material.dart';

// Asegúrate de que las rutas a tus pantallas sean las correctas según tu estructura de carpetas
import 'package:bienesta_integral/feactures/admin/pages/inventory_screen.dart';
import 'package:bienesta_integral/feactures/admin/pages/account_status_screen.dart';

class AdminDrawer extends StatelessWidget {
  const AdminDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // El color de fondo del Drawer es claro, como en la imagen
    return Drawer(
      backgroundColor: const Color(0xFFFCF9ED),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Encabezado del Drawer
          const SizedBox(
            height: 120,
            child: DrawerHeader(
              child: Text(
                'Bienestar integral',
                style: TextStyle(
                  color: Color(0xFF2C2C2C),
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),

          // --- Lista de opciones del menú ---
          _buildDrawerItem(
            title: 'Editar perfil',
            onTap: () {
              // TODO: Navegar a la pantalla de editar perfil
            },
            isSelected: true, // Marcado como seleccionado por defecto
          ),
          _buildDrawerItem(
            title: 'Inventario',
            onTap: () {
              Navigator.pop(context); // Cierra el Drawer
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const InventoryScreen()),
              );
            },
          ),
          _buildDrawerItem(
            title: 'Configuración',
            onTap: () {
              // TODO: Navegar a la pantalla de configuración
            },
          ),
          _buildDrawerItem(
            title: 'Notificaciones',
            onTap: () {
              // TODO: Navegar a la pantalla de notificaciones
            },
          ),
          _buildDrawerItem(
            title: 'Estado de cuenta',
            onTap: () {
              Navigator.pop(context); // Cierra el Drawer
              // Navega a la pantalla de Estado de Cuenta
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AccountStatusScreen()),
              );
            },
          ),
          _buildDrawerItem(
            title: 'Chat bot',
            onTap: () {
              // TODO: Navegar a la pantalla del Chat bot
            },
          ),
          _buildDrawerItem(
            title: 'Reporte de gastos',
            onTap: () {
              // TODO: Navegar a la pantalla de reporte de gastos
            },
          ),

          // El Spacer empuja el siguiente widget (Cerrar sesión) al fondo
          const Spacer(),

          // Opción de cerrar sesión al final
          Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: _buildDrawerItem(
              title: 'Cerrar sesión',
              onTap: () {
                // TODO: Implementar la lógica para cerrar sesión
              },
            ),
          ),
        ],
      ),
    );
  }

  /// Widget helper para construir cada opción del menú de forma consistente.
  Widget _buildDrawerItem({
    required String title,
    required VoidCallback onTap,
    bool isSelected = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(25), // Bordes redondeados
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          decoration: BoxDecoration(
            // Si está seleccionado, usa el color amarillo claro; si no, es transparente
            color: isSelected ? const Color(0xFFFFF3C4) : Colors.transparent,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text(
            title,
            style: const TextStyle(
              color: Color(0xFF2C2C2C), // Texto oscuro
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}