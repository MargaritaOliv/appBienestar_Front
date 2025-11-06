import 'package:flutter/material.dart';
import '../widgets/admin_header_with_back.dart';
import '../widgets/admin_text_field.dart';

class LaunchEventScreen extends StatefulWidget {
  const LaunchEventScreen({super.key});

  @override
  State<LaunchEventScreen> createState() => _LaunchEventScreenState();
}

class _LaunchEventScreenState extends State<LaunchEventScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _placeController = TextEditingController();
  final _dateController = TextEditingController();
  final _timeController = TextEditingController();
  final _descriptionController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _placeController.dispose();
    _dateController.dispose();
    _timeController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF8B7355),
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Color(0xFF2C2C2C),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        _dateController.text =
        '${picked.day.toString().padLeft(2, '0')}/'
            '${picked.month.toString().padLeft(2, '0')}/'
            '${picked.year}';
      });
    }
  }

  Future<void> _selectTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF8B7355),
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Color(0xFF2C2C2C),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        final hour = picked.hourOfPeriod;
        final minute = picked.minute.toString().padLeft(2, '0');
        final period = picked.period == DayPeriod.am ? 'am' : 'pm';
        _timeController.text = '$hour:$minute $period';
      });
    }
  }

  void _handleLaunchEvent() {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _isLoading = true;
      });

      // Simular llamada al backend
      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          setState(() {
            _isLoading = false;
          });

          // Mostrar diálogo de éxito
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              title: const Text(
                '¡Evento creado!',
                style: TextStyle(
                  color: Color(0xFF8B7355),
                  fontWeight: FontWeight.bold,
                ),
              ),
              content: const Text(
                'El evento ha sido lanzado exitosamente.',
                style: TextStyle(fontSize: 14),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Cerrar diálogo
                    Navigator.pop(context); // Volver a home admin
                  },
                  child: const Text(
                    'Aceptar',
                    style: TextStyle(
                      color: Color(0xFF8B7355),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Column(
        children: [
          // Header reutilizable
          const AdminHeaderWithBack(
            title: 'Lanzar nuevo evento',
          ),

          // Formulario scrollable
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 8),

                    // Nombre del evento
                    AdminTextField(
                      label: 'Nombre del evento',
                      controller: _nameController,
                      hint: 'Ej: Donación navideña',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingresa el nombre del evento';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 20),

                    // Lugar
                    AdminTextField(
                      label: 'Lugar',
                      controller: _placeController,
                      hint: 'Ej: Calzada al sumidero',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingresa el lugar';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 20),

                    // Fecha
                    AdminTextField(
                      label: 'Fecha',
                      controller: _dateController,
                      hint: 'Selecciona una fecha',
                      readOnly: true,
                      onTap: _selectDate,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor selecciona una fecha';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 20),

                    // Hora
                    AdminTextField(
                      label: 'Hora',
                      controller: _timeController,
                      hint: 'Selecciona una hora',
                      readOnly: true,
                      onTap: _selectTime,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor selecciona una hora';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 20),

                    // Descripción
                    AdminTextField(
                      label: 'Descripción',
                      controller: _descriptionController,
                      hint: 'Describe el evento...',
                      maxLines: 5,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingresa una descripción';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 32),

                    // Botón Lanzar evento
                    ElevatedButton(
                      onPressed: _isLoading ? null : _handleLaunchEvent,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF8B7355),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 2,
                      ),
                      child: _isLoading
                          ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      )
                          : const Text(
                        'Lanzar evento',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}