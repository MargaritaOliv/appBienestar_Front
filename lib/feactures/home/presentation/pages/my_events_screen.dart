import 'package:flutter/material.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/my_event_card.dart';
import '../widgets/confirmation_dialog.dart';
import '../widgets/success_dialog.dart';
import '../widgets/empty_state_widget.dart';

class MyEventsScreen extends StatefulWidget {
  const MyEventsScreen({super.key});

  @override
  State<MyEventsScreen> createState() => _MyEventsScreenState();
}

class _MyEventsScreenState extends State<MyEventsScreen> {

  final List<Map<String, dynamic>> _myEvents = [
    {
      'eventName': 'Cena navideña',
      'date': '03 Oct 2026',
      'time': '02:30 pm - 5:00 pm',
      'location': 'Calzada al sumidero, enfrente de Bodega Aurrera',
      'tasks': [
        'Personal de limpieza',
        'Personal de apoyo',
      ],
    },
    {
      'eventName': 'Desayuno Comunitario',
      'date': '10 Nov 2026',
      'time': '02:30 pm - 5:00 pm',
      'location': 'Calzada al sumidero, enfrente de Bodega Aurrera',
      'tasks': [
        'Personal de limpieza',
        'Personal de apoyo',
      ],
    },
  ];

  void _handleMarkComplete(String eventName) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return ConfirmationDialog(
          title: 'Marcar como completada',
          message: '¿Deseas marcar esta tarea como completada?',
          cancelText: 'Cancelar',
          confirmText: 'Completar',
          onConfirm: () {

            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return SuccessDialog(
                  message: '¡Tarea marcada como completada!',
                  onClose: () {

                  },
                );
              },
            );
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
        title: 'Mis eventos',
        showBackButton: true,
      ),

      body: _myEvents.isEmpty
          ? const EmptyStateWidget(
        icon: Icons.event_busy,
        title: 'No tienes eventos registrados',
        subtitle: 'Los eventos a los que te registres aparecerán aquí',
      )
          : ListView(
        padding: const EdgeInsets.all(20),
        children: _myEvents.map((event) {
          return MyEventCard(
            eventName: event['eventName'],
            date: event['date'],
            time: event['time'],
            location: event['location'],
            tasks: List<String>.from(event['tasks']),
            onMarkComplete: () => _handleMarkComplete(event['eventName']),
          );
        }).toList(),
      ),
    );
  }
}