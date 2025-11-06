import 'package:flutter/material.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';
import '../widgets/logo_avatar.dart';
import '../widgets/login_header.dart';
import '../widgets/forgot_password_link.dart';
import '../widgets/register_link.dart';
import '../../../../core/route/app_routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _isLoading = true;
      });

      // Obtener el correo ingresado
      String email = _emailController.text.trim().toLowerCase();

      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          setState(() {
            _isLoading = false;
          });

          // Detectar si es admin por el correo
          if (email == 'admin@bienestar.com' || email.contains('admin')) {
            // Redirigir al Home Admin
            Navigator.pushReplacementNamed(context, AppRoutes.homeAdmin);

            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Bienvenido Admin'),
                backgroundColor: Color(0xFF8B7355),
              ),
            );
          } else {
            // Redirigir al Home Voluntario
            Navigator.pushReplacementNamed(context, AppRoutes.home);

            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Login exitoso'),
                backgroundColor: Color(0xFF8B7355),
              ),
            );
          }
        }
      });
    }
  }

  void _handleForgotPassword() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Función de recuperar contraseña próximamente'),
      ),
    );
  }

  void _handleRegister() {
    Navigator.pushNamed(context, AppRoutes.register);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),

                  const LoginHeader(
                    title: 'Bienvenido',
                    subtitle: 'Inicia sesión para continuar',
                  ),

                  const SizedBox(height: 40),

                  const LogoAvatar(
                    size: 120,
                  ),

                  const SizedBox(height: 40),

                  CustomTextField(
                    label: 'Correo electrónico',
                    icon: Icons.email_outlined,
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingresa tu correo';
                      }
                      if (!value.contains('@')) {
                        return 'Por favor ingresa un correo válido';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 20),

                  CustomTextField(
                    label: 'Contraseña',
                    icon: Icons.lock_outline,
                    isPassword: true,
                    controller: _passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingresa tu contraseña';
                      }
                      if (value.length < 6) {
                        return 'La contraseña debe tener al menos 6 caracteres';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 12),

                  ForgotPasswordLink(
                    onTap: _handleForgotPassword,
                  ),

                  const SizedBox(height: 24),

                  CustomButton(
                    text: 'Iniciar Sesión',
                    onPressed: _handleLogin,
                    isLoading: _isLoading,
                  ),

                  const SizedBox(height: 24),

                  RegisterLink(
                    onTap: _handleRegister,
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}