import 'package:flutter/material.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/event_card.dart';
import '../widgets/home_app_bar.dart';
import '../../../../core/route/app_routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Colores PIO FC
  static const Color pioYellow = Color(0xFFFFD700); // Amarillo dorado
  static const Color pioBlack = Color(0xFF1A1A1A); // Negro
  static const Color pioWhite = Color(0xFFFFFFFF); // Blanco
  static const Color pioGray = Color(0xFF424242); // Gris para textos secundarios

  final List<Map<String, String>> _events = [
    {
      'title': 'Margarita Olivera',
      'location': 'Sda poniente norte',
      'image': 'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?w=800',
    },
    {
      'title': 'Cocina Champo',
      'location': 'Sda poniente norte',
      'image': 'https://images.unsplash.com/photo-1509440159596-0249088772ff?w=800',
    },
    {
      'title': 'Cocina Champo',
      'location': 'Sda poniente norte',
      'image': 'https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=800',
    },
    {
      'title': 'Cocina Champo',
      'location': 'Sda poniente norte',
      'image': 'https://images.unsplash.com/photo-1490645935967-10de6ba17061?w=800',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pioWhite,

      appBar: const HomeAppBar(
        title: 'Bienestar integral',
      ),

      // Drawer
      drawer: const CustomDrawer(
        userName: 'Bienestar integral',
        // userPhoto: 'url_de_foto',
      ),

      // Body
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 1));
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('Eventos actualizados'),
                duration: const Duration(seconds: 1),
                backgroundColor: pioWhite,
                behavior: SnackBarBehavior.floating,
              ),
            );
          }
        },
        color: pioYellow,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            // Header con fondo amarillo
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: pioWhite,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: pioWhite.withOpacity(0.3),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Eventos disponibles',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: pioBlack,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Aportar te da vida',
                    style: TextStyle(
                      fontSize: 16,
                      color: pioBlack.withOpacity(0.8),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Lista de eventos
            ..._events.map((event) {
              return EventCard(
                title: event['title']!,
                location: event['location']!,
                imageUrl: event['image']!,
                onTap: () {
                  _showEventDetails(context, event);
                },
              );
            }).toList(),

            // Empty state
            if (_events.isEmpty)
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    children: [
                      Icon(
                        Icons.event_busy,
                        size: 80,
                        color: pioGray.withOpacity(0.5),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Por el momento no hay cocinas cerca de ti',
                        style: TextStyle(
                          fontSize: 16,
                          color: pioGray,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Vuelve más tarde para ver nuevas oportunidades',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: pioGray.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _showEventDetails(BuildContext context, Map<String, String> event) {
    showModalBottomSheet(
      context: context,
      backgroundColor: pioWhite,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Barra superior - AMARILLA
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: pioYellow,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Header del evento
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: pioYellow,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      Icons.restaurant,
                      color: pioBlack,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          event['title']!,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: pioBlack,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              size: 16,
                              color: pioGray,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              event['location']!,
                              style: TextStyle(
                                fontSize: 14,
                                color: pioGray,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Descripción
              Text(
                'Descripción',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: pioBlack,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Se busca personal para evento de cocina. Experiencia preferible pero no necesaria.',
                style: TextStyle(
                  fontSize: 14,
                  color: pioGray,
                  height: 1.4,
                ),
              ),

              const SizedBox(height: 24),

              // Botones
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: pioBlack, width: 2),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Cerrar',
                        style: TextStyle(
                          color: pioBlack,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(
                          context,
                          AppRoutes.eventDetails,
                          arguments: event,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: pioYellow,
                        foregroundColor: pioBlack,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        elevation: 4,
                        shadowColor: pioYellow.withOpacity(0.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Ver más',
                        style: TextStyle(
                          color: pioBlack,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }
}