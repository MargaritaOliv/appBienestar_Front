import 'package:flutter/material.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/settings_option_card.dart';
import '../widgets/settings_switch_card.dart';
import '../widgets/settings_section_header.dart';
import '../widgets/theme_dialog.dart';
import '../widgets/confirmation_dialog.dart';
import '../../../../core/route/app_routes.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  String _selectedTheme = 'light';
  bool _notificationsEnabled = true;
  bool _emailNotifications = true;
  bool _soundEnabled = true;

  String _getThemeLabel() {
    switch (_selectedTheme) {
      case 'light':
        return 'Claro';
      case 'dark':
        return 'Oscuro';
      case 'system':
        return 'Sistema';
      default:
        return 'Claro';
    }
  }

  void _showThemeDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ThemeDialog(
          currentTheme: _selectedTheme,
          onThemeSelected: (theme) {
            setState(() {
              _selectedTheme = theme;
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Tema cambiado a ${_getThemeLabel()}'),
                backgroundColor: const Color(0xFF8B7355),
              ),
            );
          },
        );
      },
    );
  }

  void _showLanguageDialog() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Cambio de idioma próximamente'),
        backgroundColor: Color(0xFF8B7355),
      ),
    );
  }

  void _showAboutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Acerca de'),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Bienestar Integral',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text('Versión 1.0.0'),
              SizedBox(height: 16),
              Text(
                'Aplicación para gestión de eventos de voluntariado y bienestar comunitario.',
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'Cerrar',
                style: TextStyle(color: Color(0xFF8B7355)),
              ),
            ),
          ],
        );
      },
    );
  }

  void _handleDeleteAccount() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return ConfirmationDialog(
          title: 'Eliminar cuenta',
          message: '¿Estás seguro? Esta acción no se puede deshacer.',
          cancelText: 'Cancelar',
          confirmText: 'Eliminar',
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),

      appBar: const HomeAppBar(
        title: 'Configuración',
        showBackButton: true,
      ),

      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [

          const SettingsSectionHeader(title: 'Apariencia'),

          SettingsOptionCard(
            icon: Icons.palette,
            title: 'Tema',
            subtitle: _getThemeLabel(),
            onTap: _showThemeDialog,
          ),

          SettingsOptionCard(
            icon: Icons.language,
            title: 'Idioma',
            subtitle: 'Español',
            onTap: _showLanguageDialog,
          ),


          const SettingsSectionHeader(title: 'Notificaciones'),

          SettingsSwitchCard(
            icon: Icons.notifications,
            title: 'Notificaciones push',
            subtitle: 'Recibir notificaciones de eventos',
            value: _notificationsEnabled,
            onChanged: (value) {
              setState(() {
                _notificationsEnabled = value;
              });
            },
          ),

          SettingsSwitchCard(
            icon: Icons.email,
            title: 'Notificaciones por correo',
            subtitle: 'Recibir actualizaciones por email',
            value: _emailNotifications,
            onChanged: (value) {
              setState(() {
                _emailNotifications = value;
              });
            },
          ),

          SettingsSwitchCard(
            icon: Icons.volume_up,
            title: 'Sonido',
            subtitle: 'Reproducir sonidos de notificaciones',
            value: _soundEnabled,
            onChanged: (value) {
              setState(() {
                _soundEnabled = value;
              });
            },
          ),


          const SettingsSectionHeader(title: 'Información'),

          SettingsOptionCard(
            icon: Icons.privacy_tip,
            title: 'Política de privacidad',
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Abriendo política de privacidad...'),
                  backgroundColor: Color(0xFF8B7355),
                ),
              );
            },
          ),

          SettingsOptionCard(
            icon: Icons.description,
            title: 'Términos y condiciones',
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Abriendo términos y condiciones...'),
                  backgroundColor: Color(0xFF8B7355),
                ),
              );
            },
          ),

          SettingsOptionCard(
            icon: Icons.info,
            title: 'Acerca de',
            subtitle: 'Versión 1.0.0',
            onTap: _showAboutDialog,
          ),


          const SettingsSectionHeader(title: 'Cuenta'),

          SettingsOptionCard(
            icon: Icons.delete_forever,
            title: 'Eliminar cuenta',
            onTap: _handleDeleteAccount,
            trailing: const Icon(
              Icons.chevron_right,
              color: Colors.red,
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}