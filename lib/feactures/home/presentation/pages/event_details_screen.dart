import 'package:flutter/material.dart';
import '../widgets/event_item_card.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/confirmation_dialog.dart';
import '../widgets/success_dialog.dart';
import '../../../../core/route/app_routes.dart';

class EventDetailsScreen extends StatefulWidget {
  const EventDetailsScreen({super.key});

  @override
  State<EventDetailsScreen> createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends State<EventDetailsScreen> {

  late Map<String, dynamic> eventData;


  final List<Map<String, String>> _subEvents = [
    {
      'title': 'Evento 1',
      'description': '------------------------------------',
      'date': '24/12/2025',
      'attending': '0/20',
    },
    {
      'title': 'Evento 1',
      'description': '------------------------------------',
      'date': '24/12/2025',
      'attending': '0/20',
    },
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    eventData = args ?? {
      'title': 'Cocina integral',
      'organizer': 'Irving Champo',
      'schedule': 'martes, 5:30 a.m.-5p.m.',
      'image': 'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?w=800',
    };
  }

  void _handleDonate() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return ConfirmationDialog(
          title: 'Confirmar donación',
          message: '¿Deseas realizar una donación para este evento?',
          cancelText: 'Cancelar',
          confirmText: 'Donar',
          onConfirm: () {

            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return const SuccessDialog(
                  message: '¡Gracias por tu donación!',
                );
              },
            );
          },
        );
      },
    );
  }

  void _handleRegister() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return ConfirmationDialog(
          title: 'Confirmar inscripción',
          message: '¿Deseas inscribirte como voluntario a este evento?',
          cancelText: 'Cancelar',
          confirmText: 'Inscribirse',
          onConfirm: () {

            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return const SuccessDialog(
                  message: '¡Te has inscrito exitosamente!',
                );
              },
            );
          },
        );
      },
    );
  }

  void _goToEventDetail(Map<String, String> event) {
    Navigator.pushNamed(
      context,
      AppRoutes.eventDetail,
      arguments: event,
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

      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Stack(
                    children: [

                      Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(eventData['image'] ?? ''),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black.withOpacity(0.7),
                              ],
                            ),
                          ),
                        ),
                      ),


                      Positioned(
                        bottom: 16,
                        left: 16,
                        right: 16,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                eventData['title'] ?? 'Cocina integral',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF8B7355),
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              eventData['organizer'] ?? 'Irving Champo',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                shadows: [
                                  Shadow(
                                    color: Colors.black45,
                                    blurRadius: 4,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),


                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        bottom: BorderSide(
                          color: Color(0xFFE0E0E0),
                          width: 1,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        const Text(
                          'Horarios:',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF2C2C2C),
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            eventData['schedule'] ?? 'martes, 5:30 a.m.-5p.m.',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color(0xFF757575),
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                        const Icon(
                          Icons.keyboard_arrow_down,
                          color: Color(0xFF757575),
                        ),
                      ],
                    ),
                  ),


                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: _subEvents.map((event) {
                        return EventItemCard(
                          title: event['title']!,
                          description: event['description']!,
                          date: event['date']!,
                          attending: event['attending']!,
                          onTap: () => _goToEventDetail(event),
                        );
                      }).toList(),
                    ),
                  ),

                  const SizedBox(height: 80),
                ],
              ),
            ),
          ),


          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: _handleDonate,
                    icon: const Icon(
                      Icons.favorite_border,
                      size: 18,
                      color: Color(0xFF8B7355),
                    ),
                    label: const Text(
                      'Donar',
                      style: TextStyle(
                        color: Color(0xFF8B7355),
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                        color: Color(0xFF8B7355),
                        width: 1.5,
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: _handleRegister,
                    icon: const Icon(
                      Icons.edit_note,
                      size: 18,
                      color: Colors.white,
                    ),
                    label: const Text(
                      'Inscribirse',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF8B7355),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}