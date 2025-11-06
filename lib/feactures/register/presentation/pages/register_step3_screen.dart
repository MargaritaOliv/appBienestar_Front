import 'package:flutter/material.dart';
import '../widgets/back_button_custom.dart';
import '../widgets/custom_checkbox.dart';
import '../widgets/day_selector.dart';
import '../../../login/presentation/widgets/custom_button.dart';

class RegisterStep3Screen extends StatefulWidget {
  const RegisterStep3Screen({super.key});

  @override
  State<RegisterStep3Screen> createState() => _RegisterStep3ScreenState();
}

class _RegisterStep3ScreenState extends State<RegisterStep3Screen> {

  final Map<String, bool> _skills = {
    'Cocinero': false,
    'Mesero': false,
    'Personal de limpieza': false,
    'Coordinador de eventos': false,
    'Ayudante de cocina': false,
    'Personal de apoyo (Multi-habilidades)': false,
  };


  final Map<String, bool> _availability = {
    'D': false,
    'L': false,
    'M': false,
    'X': false,
    'J': false,
    'V': false,
    'S': false,
  };

  void _toggleSkill(String skill) {
    setState(() {
      _skills[skill] = !(_skills[skill] ?? false);
    });
  }

  void _toggleDay(String day) {
    setState(() {
      _availability[day] = !(_availability[day] ?? false);
    });
  }

  void _handleContinue() {
    bool hasSkills = _skills.values.any((selected) => selected);

    if (!hasSkills) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Debes seleccionar al menos una habilidad'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }


    bool hasAvailability = _availability.values.any((selected) => selected);

    if (!hasAvailability) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Debes seleccionar al menos un día de disponibilidad'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }


    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('¡Registro completado exitosamente!'),
        backgroundColor: Color(0xFF8B7355),
      ),
    );


    Navigator.pushNamedAndRemoveUntil(
      context,
      '/login',
          (route) => false,
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
                  'Habilidades',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2C2C2C),
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Ayúdanos indicando las habilidades en las\nque te consideras bueno',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF757575),
                    height: 1.4,
                  ),
                ),

                const SizedBox(height: 24),


                ..._skills.keys.map((skill) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: CustomCheckbox(
                      label: skill,
                      value: _skills[skill] ?? false,
                      onChanged: (value) => _toggleSkill(skill),
                    ),
                  );
                }).toList(),

                const SizedBox(height: 32),


                const Text(
                  'Disponibilidad',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2C2C2C),
                  ),
                ),

                const SizedBox(height: 24),


                DaySelector(
                  selectedDays: _availability,
                  onDayToggle: _toggleDay,
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