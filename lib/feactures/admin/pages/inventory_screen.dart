import 'package:flutter/material.dart';
import '../widgets/inventory_item_card.dart'; // Asegúrate que la ruta sea correcta

class InventoryScreen extends StatelessWidget {
  const InventoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFDF5), // Fondo de la pantalla
      // AppBar personalizado
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
          backgroundColor: const Color(0xFFF9E28A),
          elevation: 0,
          automaticallyImplyLeading: false, // Ocultamos el botón de regreso por defecto
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
          title: const Text(
            'Bienestar integral',
            style: TextStyle(
              color: Color(0xFF2C2C2C),
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header de la sección "Inventario"
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Color(0xFF2C2C2C), size: 28),
                  onPressed: () => Navigator.of(context).pop(), // Para regresar
                ),
                const SizedBox(width: 8),
                const Text(
                  'Inventario',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2C2C2C),
                  ),
                ),
              ],
            ),
          ),

          // Lista de productos
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: const [
                InventoryItemCard(
                  name: 'Arroz',
                  quantity: '25 kg',
                  status: 'Disponible',
                ),
                InventoryItemCard(
                  name: 'Frijoles',
                  quantity: '4 kg',
                  status: 'Bajo stock',
                ),
                InventoryItemCard(
                  name: 'Leche',
                  quantity: '8 L',
                  status: 'Perecedero',
                ),
                InventoryItemCard(
                  name: 'Agua embotellada',
                  quantity: '40 botellas',
                  status: 'Disponible',
                ),
              ],
            ),
          ),

          // Botones de acción
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _ActionButton(label: 'Registrar compra', onPressed: () {}),
                    _ActionButton(label: 'Registrar donación', onPressed: () {}),
                  ],
                ),
                const SizedBox(height: 12),
                _ActionButton(label: 'Agregar producto', onPressed: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Widget privado para los botones de acción
class _ActionButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const _ActionButton({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFF9E28A),
        foregroundColor: const Color(0xFF2C2C2C),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 2,
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    );
  }
}