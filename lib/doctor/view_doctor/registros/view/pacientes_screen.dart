import 'package:diet_recipe_app/services/patient_service.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class CreatePacientes extends StatefulWidget {
  const CreatePacientes({Key? key}) : super(key: key);

  @override
  _CreatePacientes createState() => _CreatePacientes();
}

class _CreatePacientes extends State<CreatePacientes> {
  final _formKey = GlobalKey<FormState>();
  final PatientService _patientService = PatientService(); // Instancia del servicio

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();
  final TextEditingController _contactNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  String _message = '';  // Para mostrar mensajes

  void _handleCreatePatient() async {
    if (_formKey.currentState?.validate() ?? false) {
      final firstName = _firstNameController.text;
      final lastName = _lastNameController.text;
      final dateOfBirth = _dateOfBirthController.text;
      final contactNumber = _contactNumberController.text;
      final email = _emailController.text;

      final patientData = {
        'first_name': firstName,
        'last_name': lastName,
        'date_of_birth': dateOfBirth,
        'contact_number': contactNumber,
        'email': email,
      };

      // Verificar si el paciente ya existe
      final exists = await _patientService.checkIfPatientExists(email, contactNumber);
      if (exists) {
        setState(() {
          _message = 'El paciente con este correo o número de contacto ya existe. Por favor, corrige los datos.';
        });
      } else {
        try {
          final responseMessage = await _patientService.createPatient(patientData);
          setState(() {
     _message = 'Paciente creado exitosamente';
          });
        } catch (e) {
          setState(() {
            _message = 'Error al crear paciente: $e';
          });
        }
      }
    }
  }

  // Método para mostrar el calendario y seleccionar una fecha
  Future<void> _selectDate(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            buttonTheme: ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
            ),
            scaffoldBackgroundColor: Colors.white,
            dialogBackgroundColor: Colors.white,
          ),
          child: child!,
        );
      },
    );

    if (selectedDate != null && selectedDate != DateTime.now()) {
      setState(() {
        _dateOfBirthController.text = "${selectedDate.toLocal()}".split(' ')[0];  // Formato YYYY-MM-DD
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 11, 103, 116),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Pacientes'),
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 11, 103, 116),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  child: const Text(
                    'Crear Pacientes',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      _buildStyledTextFormField(_firstNameController, 'Nombre'),
                      _buildStyledTextFormField(_lastNameController, 'Apellido'),
                      _buildDateField(), // Campo de fecha con calendario
                      _buildStyledTextFormField(_contactNumberController, 'Número de Contacto'),
                      _buildStyledTextFormField(_emailController, 'Correo Electrónico'),

                      const SizedBox(height: 20),
                         ElevatedButton(
                  onPressed: _handleCreatePatient,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 11, 103, 116),
                    minimumSize: Size(MediaQuery.of(context).size.width * 0.6, 60), // 60% width and 40px height
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text(
                    'Crear',
                    style: TextStyle(
                      fontSize: 16, // Adjust font size as needed
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
                      // Mostrar mensajes de éxito o error
                      if (_message.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            _message,
                            style: TextStyle(
                              color: _message.contains('Error') ? Colors.red : Colors.green,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStyledTextFormField(TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            labelText: label,
            labelStyle: const TextStyle(color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            errorStyle: const TextStyle(color: Colors.red), // Mensaje de error en rojo
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return '$label es obligatorio'; // Mensaje personalizado por campo
            }

            if (label == 'Correo Electrónico' && !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
              return 'Ingrese un correo válido';
            }

            if (label == 'Número de Contacto' && !RegExp(r'^[0-9]+$').hasMatch(value)) {
              return 'El número de contacto debe ser solo numérico';
            }

            if (label == 'Fecha de Nacimiento' && !RegExp(r'^\d{4}-\d{2}-\d{2}$').hasMatch(value)) {
              return 'La fecha debe tener el formato YYYY-MM-DD';
            }

            return null;
          },
        ),
      ),
    );
  }

  // Widget para el campo de la fecha de nacimiento con calendario
  Widget _buildDateField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: () => _selectDate(context), // Abre el calendario al hacer clic
        child: AbsorbPointer(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: TextFormField(
              controller: _dateOfBirthController,
              decoration: InputDecoration(
                labelText: 'Fecha de Nacimiento',
                labelStyle: const TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                errorStyle: const TextStyle(color: Colors.red),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'La fecha de nacimiento es obligatoria';
                }
                return null;
              },
            ),
          ),
        ),
      ),
    );
  }
}