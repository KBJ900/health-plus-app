import 'package:diet_recipe_app/services/company_service.dart'; 
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CreateCompania extends StatefulWidget {
  const CreateCompania({Key? key}) : super(key: key);

  @override
  _CreateCompania createState() => _CreateCompania();
}

class _CreateCompania extends State<CreateCompania> {
  final _formKey = GlobalKey<FormState>();

  // Controladores para cada campo
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _contactNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  final String _baseUrl = "https://health-back-lingering-wave-8458.fly.dev/api/companies";

  final CompanyService _companyService = CompanyService(); // Instanciamos el servicio

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 11, 103, 116),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Regresar a la pantalla anterior
          },
        ),
        title: const Text('Compañias'),
      ),
      resizeToAvoidBottomInset: false, // No mover el contenido al abrir el teclado
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
                    'Registrar Compañia de Seguro',
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
                      _buildStyledTextFormField(_companyNameController, 'Nombre de la Compañía'),
                      _buildStyledTextFormField(_contactNumberController, 'Número de Contacto'),
                      _buildStyledTextFormField(_emailController, 'Correo Electrónico'),
                      _buildStyledTextFormField(_addressController, 'Dirección'),

                      const SizedBox(height: 20),

                      ElevatedButton(
                  onPressed: _submitForm,
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
                )
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

Future<void> _submitForm() async {
  FocusScope.of(context).unfocus();

  // Verificar si todos los campos están completos
  if (_formKey.currentState?.validate() ?? false) {
    final companyData = {
      "company_name": _companyNameController.text,
      "contact_number": _contactNumberController.text,
      "email": _emailController.text,
      "address": _addressController.text,
    };

    try {
      // Obtener todas las compañías registradas
      List<Map<String, dynamic>> companies = await _companyService.getCompanies();

      // Verificar si ya existe alguna compañía con el mismo nombre, número, correo o dirección
      for (var company in companies) {
        if (company['company_name'] == companyData['company_name']) {
          _showSnackbar('Ya existe una compañía con ese nombre');
          return;
        }
        if (company['contact_number'] == companyData['contact_number']) {
          _showSnackbar('Ya existe una compañía con ese número de contacto');
          return;
        }
        if (company['email'] == companyData['email']) {
          _showSnackbar('Ya existe una compañía con ese correo electrónico');
          return;
        }
        if (company['address'] == companyData['address']) {
          _showSnackbar('Ya existe una compañía con esa dirección');
          return;
        }
      }

      // Crear la compañía si no existe
      bool success = await _companyService.createCompany(companyData);

      if (success) {
        _showSnackbar('Compañía registrada con éxito');
        _clearInputs(); // Limpiar los campos si la creación fue exitosa
      } else {
        _showSnackbar('Error al registrar la compañía');
      }
    } catch (e) {
      _showSnackbar('Error: $e');
    }
  }
}


  void _clearInputs() {
    _companyNameController.clear();
    _contactNumberController.clear();
    _emailController.clear();
    _addressController.clear();
  }

  void _showSnackbar(String message) {
    final snackBar = SnackBar(
      content: Text(message, style: TextStyle(color: Colors.black)), // Texto negro en el mensaje
      backgroundColor: Colors.green[800],
      duration: Duration(seconds: 3),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
            contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            errorStyle: const TextStyle(color: Colors.red), // Color para el mensaje de error
          ),
          keyboardType: label == 'Número de Contacto' ? TextInputType.number : TextInputType.text,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return label == 'Número de Contacto'
                  ? 'El número de contacto es obligatorio'
                  : label == 'Correo Electrónico'
                      ? 'El correo electrónico es obligatorio'
                      : 'Este campo es obligatorio';
            }

            // Validación para el correo electrónico
            if (label == 'Correo Electrónico' && !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
              return 'Por favor ingrese un correo válido';
            }

            // Validación para el número de teléfono
            if (label == 'Número de Contacto' && !RegExp(r'^[0-9]+$').hasMatch(value)) {
              return 'El número de teléfono debe ser solo numérico';
            }

            return null;
        },
      ),
    ),
  );
  }
}
