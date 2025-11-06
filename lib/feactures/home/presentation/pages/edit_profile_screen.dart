import 'package:flutter/material.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/confirmation_dialog.dart';
import '../widgets/success_dialog.dart';
import '../widgets/edit_profile_header.dart';
import '../widgets/profile_text_field.dart';
import '../widgets/skill_checkbox_item.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();


  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _firstLastNameController = TextEditingController();
  final TextEditingController _secondLastNameController = TextEditingController();


  final Map<String, bool> _skills = {
    'Cocinero': false,
    'Mesero': false,
    'Personal de limpieza': false,
    'Coordinador de eventos': false,
    'Ayudante de cocina': false,
    'Personal de apoyo (Multi-habilidades)': false,
  };

  @override
  void initState() {
    super.initState();

    _nameController.text = 'Juan';
    _firstLastNameController.text = 'Pérez';
    _secondLastNameController.text = 'García';
    _skills['Cocinero'] = true;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _firstLastNameController.dispose();
    _secondLastNameController.dispose();
    super.dispose();
  }

  void _handleChangePhoto() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Cambiar foto de perfil'),
        backgroundColor: Color(0xFF8B7355),
      ),
    );
  }

  void _handleCancel() {
    Navigator.pop(context);
  }

  void _handleSave() {
    if (_formKey.currentState?.validate() ?? false) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return ConfirmationDialog(
            title: 'Guardar cambios',
            message: '¿Deseas guardar los cambios realizados?',
            cancelText: 'Cancelar',
            confirmText: 'Guardar',
            onConfirm: () {

              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return SuccessDialog(
                    message: '¡Perfil actualizado exitosamente!',
                    onClose: () {
                      Navigator.pop(context);
                    },
                  );
                },
              );
            },
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),

      appBar: const HomeAppBar(
        title: 'Bienestar integral',
        showBackButton: true,
      ),

      body: Form(
        key: _formKey,
        child: Column(
          children: [

            EditProfileHeader(
              onCameraPressed: _handleChangePhoto,
              photoUrl: null,
            ),


            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    ProfileTextField(
                      label: 'Nombres',
                      controller: _nameController,
                      hintText: 'Ingresa tus nombres',
                      icon: Icons.person,
                    ),

                    const SizedBox(height: 16),


                    ProfileTextField(
                      label: 'Primer apellido',
                      controller: _firstLastNameController,
                      hintText: 'Ingresa tu primer apellido',
                      icon: Icons.person_outline,
                    ),

                    const SizedBox(height: 16),


                    ProfileTextField(
                      label: 'Segundo apellido',
                      controller: _secondLastNameController,
                      hintText: 'Ingresa tu segundo apellido',
                      icon: Icons.person_outline,
                      isRequired: false,
                    ),

                    const SizedBox(height: 32),


                    const Text(
                      'Habilidades',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2C2C2C),
                      ),
                    ),

                    const SizedBox(height: 16),


                    ..._skills.keys.map((skill) {
                      return SkillCheckboxItem(
                        title: skill,
                        value: _skills[skill]!,
                        onChanged: (bool? value) {
                          setState(() {
                            _skills[skill] = value ?? false;
                          });
                        },
                      );
                    }).toList(),

                    const SizedBox(height: 24),
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
                    child: ElevatedButton(
                      onPressed: _handleCancel,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFBDBDBD),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Cancelar',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _handleSave,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF8B7355),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Guardar',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}