import 'package:flutter/material.dart';
import '../widgets/back_button_custom.dart';
import '../widgets/verification_field.dart';
import '../../../login/presentation/widgets/custom_button.dart';
import '../../../login/presentation/widgets/logo_avatar.dart';

class RegisterStep2Screen extends StatefulWidget {
  const RegisterStep2Screen({super.key});

  @override
  State<RegisterStep2Screen> createState() => _RegisterStep2ScreenState();
}

class _RegisterStep2ScreenState extends State<RegisterStep2Screen> {
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  bool _emailVerified = false;
  bool _phoneVerified = false;

  @override
  void dispose() {
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _handleEmailVerification() {

    setState(() {
      _emailVerified = true;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Código de verificación enviado al correo'),
        backgroundColor: Color(0xFF8B7355),
      ),
    );
  }

  void _handlePhoneVerification() {

    setState(() {
      _phoneVerified = true;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Código de verificación enviado al teléfono'),
        backgroundColor: Color(0xFF8B7355),
      ),
    );
  }

  void _handleContinue() {
    if (!_emailVerified || !_phoneVerified) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Debes verificar tu correo y teléfono'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }


    Navigator.pushNamed(context, '/register-step3');
  }

  void _handleUploadPhoto() {

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Seleccionar foto de perfil'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BackButtonCustom(),

                const SizedBox(height: 16),


                const Text(
                  'Completar perfil',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2C2C2C),
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Ayúdanos a completar tu perfil',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF757575),
                  ),
                ),

                const SizedBox(height: 32),


                Center(
                  child: Stack(
                    children: [
                      const LogoAvatar(
                        size: 120,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: _handleUploadPhoto,
                          child: Container(
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(
                              color: const Color(0xFF8B7355),
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                                width: 2,
                              ),
                            ),
                            child: const Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 40),


                VerificationField(
                  label: 'Correo electrónico',
                  hint: 'irvingchampo@gmail.com',
                  icon: Icons.email_outlined,
                  controller: _emailController,
                  onVerify: _handleEmailVerification,
                  isVerified: _emailVerified,
                  keyboardType: TextInputType.emailAddress,
                ),

                const SizedBox(height: 24),


                VerificationField(
                  label: 'N. Telefono',
                  hint: '9612743191',
                  icon: Icons.phone_outlined,
                  controller: _phoneController,
                  onVerify: _handlePhoneVerification,
                  isVerified: _phoneVerified,
                  keyboardType: TextInputType.phone,
                ),

                const SizedBox(height: 40),


                CustomButton(
                  text: 'Continuar',
                  onPressed: _handleContinue,
                ),

                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}