import 'package:flutter/material.dart';
import '../widgets/transaction_card.dart'; // Asegúrate de que la ruta sea correcta

class AccountStatusScreen extends StatelessWidget {
  const AccountStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCF9ED),
      // AppBar personalizado
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9E28A),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Color(0xFF2C2C2C), size: 28),
          onPressed: () {
            // TODO: Lógica para abrir el drawer
          },
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
      body: ListView(
        children: [
          // Header de la página
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Color(0xFF2C2C2C), size: 28),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                const SizedBox(width: 8),
                const Text(
                  'Cuentas',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2C2C2C),
                  ),
                ),
              ],
            ),
          ),

          // Card de Dinero Actual
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            padding: const EdgeInsets.symmetric(vertical: 24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 10,
                ),
              ],
            ),
            child: const Column(
              children: [
                Text(
                  'Dinero Actual',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2C2C2C),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  '\$12,450.00 MXN',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2C2C2C),
                  ),
                ),
              ],
            ),
          ),

          // Título de Historial de movimientos
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Text(
              'Historial de movimientos',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2C2C2C),
              ),
            ),
          ),

          // Lista de transacciones
          const TransactionCard(
            title: 'Compra insumos',
            date: '19 oct 2025',
            source: 'Tienda local',
            amount: '\$35.50',
            isExpense: true,
          ),
          const TransactionCard(
            title: 'Donación de x persona', // Ejemplo
            date: '20 oct 2025',
            source: 'Plataforma',
            amount: '\$250.00',
            isExpense: false,
          ),
        ],
      ),
    );
  }
}