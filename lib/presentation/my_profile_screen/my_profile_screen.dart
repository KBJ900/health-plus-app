import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:uuid/uuid.dart';

class MyProfileScreen extends StatefulWidget {
  @override
  _MyProfileScreenState createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _especialidadController = TextEditingController();
  final TextEditingController _telefonoController = TextEditingController();
  final TextEditingController _correoController = TextEditingController();
  final TextEditingController _cedulaFileNameController = TextEditingController();
  final TextEditingController _ineFileNameController = TextEditingController();
  final TextEditingController _constanciaFileNameController = TextEditingController();
  final TextEditingController _bancoFileNameController = TextEditingController();
  final TextEditingController _domicilioFileNameController = TextEditingController();

  File? _selectedCedula;
  File? _selectedIne;
  File? _selectedConstancia;
  File? _selectedBanco;
  File? _selectedDomicilio;

  Future<void> _pickFile(String type) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        switch (type) {
          case 'cedula':
            _selectedCedula = File(result.files.single.path!);
            _cedulaFileNameController.text = result.files.single.name;
            break;
          case 'ine':
            _selectedIne = File(result.files.single.path!);
            _ineFileNameController.text = result.files.single.name;
            break;
          case 'constancia':
            _selectedConstancia = File(result.files.single.path!);
            _constanciaFileNameController.text = result.files.single.name;
            break;
          case 'banco':
            _selectedBanco = File(result.files.single.path!);
            _bancoFileNameController.text = result.files.single.name;
            break;
          case 'domicilio':
            _selectedDomicilio = File(result.files.single.path!);
            _domicilioFileNameController.text = result.files.single.name;
            break;
        }
      });
    }
  }

  Future<void> _submitProfile() async {
    if (_formKey.currentState!.validate()) {
      const url = 'https://health-back-lingering-wave-8458.fly.dev/api/users/doctors/doctorForm';
      var request = http.MultipartRequest('POST', Uri.parse(url));

      var uuid = Uuid();
      String uid = uuid.v4().substring(0, 6);

      request.fields['first_name'] = _nombreController.text;
      request.fields['last_name'] = _especialidadController.text;
      request.fields['specialty'] = _especialidadController.text;
      request.fields['contact_number'] = _telefonoController.text;
      request.fields['email'] = _correoController.text;
      request.fields['uid'] = uid;

      if (_selectedCedula != null) {
        request.files.add(await http.MultipartFile.fromPath('urlCedula', _selectedCedula!.path));
      }

      if (_selectedIne != null) {
        request.files.add(await http.MultipartFile.fromPath('urlIne', _selectedIne!.path));
      }

      if (_selectedConstancia != null) {
        request.files.add(await http.MultipartFile.fromPath('urlConstancia', _selectedConstancia!.path));
      }

      if (_selectedBanco != null) {
        request.files.add(await http.MultipartFile.fromPath('urlBanco', _selectedBanco!.path));
      }

      if (_selectedDomicilio != null) {
        request.files.add(await http.MultipartFile.fromPath('urlDomicilio', _selectedDomicilio!.path));
      }

      // Log del payload que estás enviando
      print('Fields: ${request.fields}');
      if (_selectedCedula != null) print('Cedula path: ${_selectedCedula!.path}');
      if (_selectedIne != null) print('INE path: ${_selectedIne!.path}');
      if (_selectedConstancia != null) print('Constancia path: ${_selectedConstancia!.path}');
      if (_selectedBanco != null) print('Banco path: ${_selectedBanco!.path}');
      if (_selectedDomicilio != null) print('Domicilio path: ${_selectedDomicilio!.path}');

      try {
        var response = await request.send();
        if (response.statusCode == 200) {
          final responseBody = await response.stream.bytesToString();
          print('Response: $responseBody');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Perfil actualizado correctamente.')),
          );
          Navigator.pushNamed(context, '/home_screen_doctor');
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error al actualizar el perfil.')),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
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
            Navigator.pop(context); // Regresar a la pantalla anterior
          },
        ),
        title: const Text('Editar Perfil'),
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
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // Subtítulo
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
                      'Editar Perfil',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                // Formulario
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTextFormField(_nombreController, 'Nombre Completo'),
                      _buildTextFormField(_especialidadController, 'Especialidad'),
                      _buildTextFormField(_telefonoController, 'Teléfono', keyboardType: TextInputType.phone),
                      _buildTextFormField(_correoController, 'Correo Electrónico', keyboardType: TextInputType.emailAddress),
                      SizedBox(height: 16),
                      Center(
                        child: Text(
                          'Documentación',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      GestureDetector(
                        onTap: () => _pickFile('cedula'),
                        child: AbsorbPointer(
                          child: _buildFilePickerField(_cedulaFileNameController, 'Subir Cédula'),
                        ),
                      ),
                      SizedBox(height: 8),
                      GestureDetector(
                        onTap: () => _pickFile('ine'),
                        child: AbsorbPointer(
                          child: _buildFilePickerField(_ineFileNameController, 'Subir INE'),
                        ),
                      ),
                      SizedBox(height: 8),
                      GestureDetector(
                        onTap: () => _pickFile('constancia'),
                        child: AbsorbPointer(
                          child: _buildFilePickerField(_constanciaFileNameController, 'Subir Constancia'),
                        ),
                      ),
                      SizedBox(height: 8),
                      GestureDetector(
                        onTap: () => _pickFile('banco'),
                        child: AbsorbPointer(
                          child: _buildFilePickerField(_bancoFileNameController, 'Subir Banco'),
                        ),
                      ),
                      SizedBox(height: 8),
                      GestureDetector(
                        onTap: () => _pickFile('domicilio'),
                        child: AbsorbPointer(
                          child: _buildFilePickerField(_domicilioFileNameController, 'Subir Domicilio'),
                        ),
                      ),
                      SizedBox(height: 16),
                      Center(
                        child: ElevatedButton(
                          onPressed: _submitProfile,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 6, 122, 55),
                            minimumSize: const Size(double.infinity, 60), // Altura fija de 60 px
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            'Guardar Cambios y Subir', // Texto del botón
                            style: TextStyle(
                              color: Colors.white, // Color del texto
                              fontSize: 16, // Tamaño de la fuente
                              fontWeight: FontWeight.bold, // Peso de la fuente
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
        ),
      ),
    );
  }

  Widget _buildTextFormField(TextEditingController controller, String label, {TextInputType keyboardType = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8, // 80% del ancho
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.7),
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
          keyboardType: keyboardType,
          decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Este campo es obligatorio';
            }
            return null;
          },
        ),
      ),
    );
  }

  Widget _buildFilePickerField(TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8, // 80% del ancho
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.7),
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
            labelStyle: TextStyle(color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            suffixIcon: Icon(Icons.attach_file),
          ),
          readOnly: true,
        ),
      ),
    );
  }
}