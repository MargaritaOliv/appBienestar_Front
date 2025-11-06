import 'package:flutter/material.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/confirmation_dialog.dart';
import '../widgets/success_dialog.dart';

class EventDetailScreen extends StatefulWidget {
  const EventDetailScreen({super.key});

  @override
  State<EventDetailScreen> createState() => _EventDetailScreenState();
}

class _EventDetailScreenState extends State<EventDetailScreen> {
  late Map<String, dynamic> eventData;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    eventData = args ?? {
      'title': 'Evento 1',
      'description': 'Este evento va dirigido a personas indígentes por las fechas navideñas',
      'date': 'Domingo 03 Oct/2026',
      'time': 'De 02:30 pm a 5:00pm',
      'location': 'Calzada al sumidero al bania baja, enfrente bodega aurrera',
      'coordinators': '2 Coordinadores',
      'extraVolunteers': '13 Voluntarios extras',
      'isFree': true,
    };
  }

  void _handleAttend() {

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return ConfirmationDialog(
          title: 'Confirmar inscripción',
          message: '¿Deseas unirte como voluntario a este evento?',
          cancelText: 'Cancelar',
          confirmText: 'Confirmar',
          onConfirm: _showSuccessDialog,
        );
      },
    );
  }

  void _showSuccessDialog() {

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return SuccessDialog(
          message: '¡Inscripción al evento ha sido exitoso!',
          buttonText: 'Cerrar',
          onClose: () {

            // Navigator.pop(context);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),

      appBar: const HomeAppBar(
        title: 'Bienestar integral',
        showBackButton: true,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                eventData['title'] ?? 'Evento 1',
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2C2C2C),
                ),
              ),

              const SizedBox(height: 8),


              Text(
                eventData['description'] ?? '',
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF757575),
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 24),


              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [

                    Container(
                      width: 100,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F5F5),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Text(
                            eventData['date']?.split(' ')[0] ?? 'Domingo',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF2C2C2C),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            eventData['date']?.split(' ')[1] ?? '03',
                            style: const TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF2C2C2C),
                            ),
                          ),
                          Text(
                            eventData['date']?.split(' ')[2] ?? 'Oct/2026',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF757575),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 20),


                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            eventData['time'] ?? 'De 02:30 pm a 5:00pm',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF2C2C2C),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),


              const Text(
                'Donde:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2C2C2C),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                eventData['location'] ?? '',
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF757575),
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 24),


              const Text(
                'Capacidad de voluntarios:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2C2C2C),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                eventData['coordinators'] ?? '2 Coordinadores',
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF757575),
                ),
              ),
              Text(
                eventData['extraVolunteers'] ?? '13 Voluntarios extras',
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF757575),
                ),
              ),

              const SizedBox(height: 32),


              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton.icon(
                  onPressed: _handleAttend,
                  icon: const Icon(
                    Icons.edit_note,
                    color: Colors.white,
                  ),
                  label: const Text(
                    'Asistir al evento',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF8B7355),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                ),
              ),

              const SizedBox(height: 16),


              if (eventData['isFree'] == true)
                const Center(
                  child: Text(
                    'Evento gratuito',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF757575),
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
