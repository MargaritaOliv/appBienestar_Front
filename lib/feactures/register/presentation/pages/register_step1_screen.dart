import 'package:flutter/material.dart';
import '../widgets/back_button_custom.dart';
import '../../../login/presentation/widgets/custom_text_field.dart';
import '../widgets/custom_dropdown.dart';
import '../../../login/presentation/widgets/custom_button.dart';
import '../widgets/custom_checkbox.dart';

class RegisterStep1Screen extends StatefulWidget {
  const RegisterStep1Screen({super.key});

  @override
  State<RegisterStep1Screen> createState() => _RegisterStep1ScreenState();
}

class _RegisterStep1ScreenState extends State<RegisterStep1Screen> {
  final _formKey = GlobalKey<FormState>();
  final _nombresController = TextEditingController();
  final _primerApellidoController = TextEditingController();
  final _segundoApellidoController = TextEditingController();
  final _municipioController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  String? _selectedEstado;
  bool _acceptTerms = false;


  final List<String> _estados = [
    'Chiapas',
    'Ciudad de México',
    'Jalisco',
    'Nuevo León',
    'Puebla',

  ];

  @override
  void dispose() {
    _nombresController.dispose();
    _primerApellidoController.dispose();
    _segundoApellidoController.dispose();
    _municipioController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _handleContinue() {
    if (_formKey.currentState?.validate() ?? false) {
      if (!_acceptTerms) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Debes aceptar los términos y condiciones'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }


      Navigator.pushNamed(context, '/register-step2');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const BackButtonCustom(),

                  const SizedBox(height: 16),


                  const Text(
                    'Crear Cuenta',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2C2C2C),
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Regístrate para comenzar',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF757575),
                    ),
                  ),

                  const SizedBox(height: 32),


                  CustomTextField(
                    label: 'Nombres',
                    icon: Icons.person_outline,
                    controller: _nombresController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingresa tus nombres';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 16),


                  CustomTextField(
                    label: 'Primer apellido',
                    icon: Icons.person_outline,
                    controller: _primerApellidoController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingresa tu primer apellido';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 16),
                  CustomTextField(
                    label: 'Segundo apellido',
                    icon: Icons.person_outline,
                    controller: _segundoApellidoController,
                  ),

                  const SizedBox(height: 16),


                  CustomDropdown(
                    label: 'Estado',
                    hint: 'Chiapas',
                    icon: Icons.location_on_outlined,
                    items: _estados,
                    value: _selectedEstado,
                    onChanged: (value) {
                      setState(() {
                        _selectedEstado = value;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor selecciona un estado';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 16),


                  CustomTextField(
                    label: 'Municipio',
                    icon: Icons.location_on_outlined,
                    controller: _municipioController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingresa tu municipio';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 16),


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

                  const SizedBox(height: 16),


                  CustomTextField(
                    label: 'Contraseña',
                    icon: Icons.lock_outline,
                    isPassword: true,
                    controller: _passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingresa una contraseña';
                      }
                      if (value.length < 6) {
                        return 'La contraseña debe tener al menos 6 caracteres';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 16),


                  CustomTextField(
                    label: 'Confirmar contraseña',
                    icon: Icons.lock_outline,
                    isPassword: true,
                    controller: _confirmPasswordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor confirma tu contraseña';
                      }
                      if (value != _passwordController.text) {
                        return 'Las contraseñas no coinciden';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 20),


                  CustomCheckbox(
                    label: 'Acepto los Términos y condiciones',
                    value: _acceptTerms,
                    onChanged: (value) {
                      setState(() {
                        _acceptTerms = value ?? false;
                      });
                    },
                    isTerms: true,
                  ),

                  const SizedBox(height: 32),


                  CustomButton(
                    text: 'Registrarse',
                    onPressed: _handleContinue,
                  ),

                  const SizedBox(height: 16),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        '¿Ya tienes cuenta? ',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF757575),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Iniciar sesión',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF8B7355),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}