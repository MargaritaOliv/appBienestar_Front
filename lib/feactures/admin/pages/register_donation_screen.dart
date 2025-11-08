import 'package:flutter/material.dart';
class RegisterDonationScreen extends StatefulWidget {
  const RegisterDonationScreen({super.key});

  @override
  State<RegisterDonationScreen> createState() => _RegisterDonationScreenState();
}

class _RegisterDonationScreenState extends State<RegisterDonationScreen> {
  String? _selectedDonationType;
  final List<String> _donationTypes = ['Monetarias', 'Productos'];

  // GlobalKey para el Scaffold y poder abrir el Drawer
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // Asignamos la key
      backgroundColor: const Color(0xFFFCF9ED), // Un tono de fondo muy claro
      // AppBar personalizado
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9E28A),
        elevation: 0,
        // Ícono de menú (hamburguesa)
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Color(0xFF2C2C2C), size: 28),
          onPressed: () {
            // TODO: Implementar la apertura de un drawer si es necesario
            // _scaffoldKey.currentState?.openDrawer();
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Color(0xFF2C2C2C), size: 28),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Registrar donación',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2C2C2C),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Formulario
              _buildTextField(label: 'Nombre del Donante'),
              _buildDropdownField(label: 'Tipo de Donación', items: _donationTypes),

              const SizedBox(height: 24),

              // Sección de productos donados
              _buildDonatedProductsSection(),
            ],
          ),
        ),
      ),
    );
  }

  // Widget helper para campos de texto
  Widget _buildTextField({required String label}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Color(0xFF2C2C2C),
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFFE0E0E0), width: 1.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFFD4B424), width: 2.0),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget helper para el dropdown
  Widget _buildDropdownField({required String label, required List<String> items}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Color(0xFF2C2C2C),
            ),
          ),
          const SizedBox(height: 8),
          DropdownButtonFormField<String>(
            value: _selectedDonationType,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFFE0E0E0), width: 1.5),
              ),
            ),
            items: items.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (newValue) {
              setState(() {
                _selectedDonationType = newValue;
              });
            },
          ),
        ],
      ),
    );
  }

  // Widget para la sección de "Productos Donados"
  Widget _buildDonatedProductsSection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE0E0E0), width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Productos Donados',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Color(0xFF2C2C2C),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: _buildProductTextField(label: 'Productos'),
              ),
              const SizedBox(width: 12),
              Expanded(
                flex: 2,
                child: _buildProductTextField(label: 'Cantidad'),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Center(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFF9E28A),
                foregroundColor: const Color(0xFF2C2C2C),
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                'Agregar producto',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget helper para los campos de texto dentro de la sección de productos
  Widget _buildProductTextField({required String label}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: Color(0xFF2C2C2C),
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 48, // Altura fija para alinear los campos
          child: TextFormField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(horizontal: 12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFFE0E0E0), width: 1.5),
              ),
            ),
          ),
        ),
      ],
    );
  }
}