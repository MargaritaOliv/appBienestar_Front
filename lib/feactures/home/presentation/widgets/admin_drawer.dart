import 'package:flutter/material.dart';
import 'package:bienesta_integral/feactures/admin/pages/inventory_screen.dart';

class AdminDrawer extends StatelessWidget {
  const AdminDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF1E1E1E), // Fondo oscuro del menú
      child: Column(
        children: [
          // Encabezado del Drawer
          const SizedBox(
            height: 120, // Altura para el encabezado
            child: DrawerHeader(
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              child: Center(
                child: Text(
                  'Bienestar integral',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),

          // Lista de opciones del menú
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildDrawerItem(
                  title: 'Editar perfil',
                  onTap: () {
                    // TODO: Navegar a la pantalla de editar perfil
                  },
                  isSelected: true, // El primer item aparece como seleccionado
                ),
                _buildDrawerItem(
                  title: 'Inventario',
                  onTap: () {
                    // Primero cierra el Drawer
                    Navigator.pop(context);
                    // Luego navega a la pantalla de Inventario
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
                    // TODO: Navegar a la pantalla de estado de cuenta
                  },
                ),
              ],
            ),
          ),

          // Separador y opción de cerrar sesión al final
          const Divider(color: Colors.white24, thickness: 1),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
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
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        // Si está seleccionado, usa el color amarillo; si no, es transparente
        color: isSelected ? const Color(0xFFF9E28A) : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            // El color del texto cambia si está seleccionado
            color: isSelected ? const Color(0xFF1E1E1E) : Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        onTap: onTap,
        dense: true,
      ),
    );
  }
}