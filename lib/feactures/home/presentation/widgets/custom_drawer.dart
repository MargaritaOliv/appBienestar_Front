import 'package:flutter/material.dart';
import '../../../../core/route/app_routes.dart';
import 'confirmation_dialog.dart';

class CustomDrawer extends StatelessWidget {
  final String userName;
  final String? userPhoto;

  const CustomDrawer({
    super.key,
    required this.userName,
    this.userPhoto,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: SafeArea(
        child: Column(
          children: [

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                color: Color(0xFF8B7355),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Avatar
                  CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.white,
                    backgroundImage: userPhoto != null
                        ? NetworkImage(userPhoto!)
                        : null,
                    child: userPhoto == null
                        ? const Icon(
                      Icons.person,
                      size: 40,
                      color: Color(0xFF8B7355),
                    )
                        : null,
                  ),
                  const SizedBox(height: 16),


                  Text(
                    userName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),


            ListTile(
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFF8B7355).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.edit,
                  color: Color(0xFF8B7355),
                  size: 20,
                ),
              ),
              title: const Text(
                'Editar perfil',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, AppRoutes.editProfile);
              },
            ),

            const Divider(height: 1, indent: 16, endIndent: 16),


            ListTile(
              leading: const Icon(
                Icons.event,
                color: Color(0xFF2C2C2C),
                size: 24,
              ),
              title: const Text(
                'Mis eventos',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, AppRoutes.myEvents);
              },
            ),


            ListTile(
              leading: const Icon(
                Icons.settings,
                color: Color(0xFF2C2C2C),
                size: 24,
              ),
              title: const Text(
                'Configuración',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, AppRoutes.settings);
              },
            ),

            const Spacer(),


            ListTile(
              leading: const Icon(
                Icons.logout,
                color: Colors.red,
                size: 24,
              ),
              title: const Text(
                'Cerrar sesión',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                  color: Colors.red,
                ),
              ),
              onTap: () {
                Navigator.pop(context);


                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return ConfirmationDialog(
                      title: 'Cerrar sesión',
                      message: '¿Estás seguro que deseas cerrar sesión?',
                      cancelText: 'Cancelar',
                      confirmText: 'Cerrar sesión',
                      onConfirm: () {

                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          AppRoutes.login,
                              (route) => false,
                        );
                      },
                    );
                  },
                );
              },
            ),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}