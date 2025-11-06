import 'package:flutter/material.dart';
import 'package:bienesta_integral/core/route/app_routes.dart';
import 'package:bienesta_integral/feactures/login/presentation/pages/login_screen.dart';
import 'package:bienesta_integral/feactures/register/presentation/pages/register_step1_screen.dart';
import 'package:bienesta_integral/feactures/register/presentation/pages/register_step2_screen.dart';
import 'package:bienesta_integral/feactures/register/presentation/pages/register_step3_screen.dart';
import 'package:bienesta_integral/feactures/home/presentation/pages/home_screen.dart';
import 'package:bienesta_integral/feactures/home/presentation/pages/event_details_screen.dart';
import 'package:bienesta_integral/feactures/home/presentation/pages/event_detail_screen.dart';
import 'package:bienesta_integral/feactures/home/presentation/pages/edit_profile_screen.dart';
import 'package:bienesta_integral/feactures/home/presentation/pages/my_events_screen.dart';
import 'package:bienesta_integral/feactures/home/presentation/pages/settings_screen.dart';
import 'package:bienesta_integral/feactures/home/presentation/pages/home_screen_admin.dart';
import 'package:bienesta_integral/feactures/admin/pages/manage_volunteers_screen.dart';
import 'package:bienesta_integral/feactures/admin/pages/launch_event_screen.dart';



class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case AppRoutes.register:
      case AppRoutes.registerStep1:
        return MaterialPageRoute(builder: (_) => const RegisterStep1Screen());

      case AppRoutes.registerStep2:
        return MaterialPageRoute(builder: (_) => const RegisterStep2Screen());

      case AppRoutes.registerStep3:
        return MaterialPageRoute(builder: (_) => const RegisterStep3Screen());


      case AppRoutes.launchEvent:
        return MaterialPageRoute(builder: (_) => const LaunchEventScreen());


      case AppRoutes.manageVolunteers:
        return MaterialPageRoute(builder: (_) => const ManageVolunteersScreen());

     case AppRoutes.home:
       return MaterialPageRoute(builder: (_) => const HomeScreen());

      case AppRoutes.eventDetails:
        return MaterialPageRoute(builder: (_) => const EventDetailsScreen());

      case AppRoutes.eventDetail:
        return MaterialPageRoute(builder: (_) => const EventDetailScreen());

      case AppRoutes.editProfile:
        return MaterialPageRoute(builder: (_) => const EditProfileScreen());

      case AppRoutes.settings:
        return MaterialPageRoute(builder: (_) => const SettingsScreen());

      case AppRoutes.myEvents:
        return MaterialPageRoute(builder: (_) => const MyEventsScreen());

      case AppRoutes.homeAdmin:
        return MaterialPageRoute(builder: (_) => const HomeScreenAdmin());

    // case AppRoutes.profile:
    //   return MaterialPageRoute(builder: (_) => const ProfileScreen());

    // case AppRoutes.wellness:
    //   return MaterialPageRoute(builder: (_) => const WellnessScreen());

    // case AppRoutes.appointments:
    //   return MaterialPageRoute(builder: (_) => const AppointmentsScreen());

    // case AppRoutes.settings:
    //   return MaterialPageRoute(builder: (_) => const SettingsScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.error_outline,
                    size: 80,
                    color: Color(0xFF8B7355),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Ruta no encontrada',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2C2C2C),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'La ruta "${settings.name}" no existe',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF757575),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
    }
  }
}