import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

class CreateExpedientes extends StatefulWidget {
  const CreateExpedientes({Key? key}) : super(key: key);

  @override
  _CreateExpedientes createState() => _CreateExpedientes();
}

class _CreateExpedientes extends State<CreateExpedientes> {
  final _formKey = GlobalKey<FormState>();
    final TextEditingController _patientNameController = TextEditingController();

  final TextEditingController _letterNumberController = TextEditingController();
  final TextEditingController _doctorIdController = TextEditingController();
  final TextEditingController _insuranceIdController = TextEditingController();
  final TextEditingController _patientIdController = TextEditingController();
  final TextEditingController _serviceDateController = TextEditingController();
  final TextEditingController _statusController = TextEditingController();

  
  File? _file;
  List<String> _insuranceCompanies = [];
  List<String> _filteredCompanies = [];
  String? _selectedInsurance;
  List<Map<String, dynamic>> _patients = [];
  List<String> _patientNames = [];
  List<Map<String, dynamic>> _doctors = [];
  List<String> _doctorNames = [];

  @override
  void initState() {
    super.initState();
    _fetchInsuranceCompanies();
        _fetchPatients();
    _fetchDoctors();

  }

  Future<void> _fetchDoctors() async {
    final url = Uri.parse('https://health-back-lingering-wave-8458.fly.dev/api/users/doctors');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        setState(() {
          _doctors = data.map((item) => item as Map<String, dynamic>).toList();
          _doctorNames = _doctors
              .map((doctor) =>
                  '${doctor["first_name"]} ${doctor["last_name"]}')
              .toList();
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al cargar los doctores')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error en la conexión')),
      );
    }
  }

  Future<void> _fetchPatients() async {
    final url = Uri.parse('https://health-back-lingering-wave-8458.fly.dev/api/users/patients');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        setState(() {
          _patients = data.map((item) => item as Map<String, dynamic>).toList();
          _patientNames = _patients
              .map((patient) =>
                  '${patient["first_name"]} ${patient["last_name"]}')
              .toList();
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al cargar los pacientes')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error en la conexión')),
      );
    }
  }


  Future<void> _fetchInsuranceCompanies() async {
    final url = Uri.parse('https://health-back-lingering-wave-8458.fly.dev/api/companies/');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        setState(() {
          _insuranceCompanies = data.map((item) => item['company_name'] as String).toList();
          _filteredCompanies = _insuranceCompanies;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al cargar las compañías de seguros')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error en la conexión')),
      );
    }
  }

  Future<void> createExpediente() async {
    if (_formKey.currentState!.validate()) {
      final url = Uri.parse('https://health-back-lingering-wave-8458.fly.dev/api/paymentLetters/invoice');
      var request = http.MultipartRequest('POST', url);

      request.fields['letter_number'] = _letterNumberController.text;
      request.fields['doctor_id'] = _doctorIdController.text;
      request.fields['insurance_id'] = _insuranceIdController.text;
      request.fields['patient_id'] = _patientIdController.text;
      request.fields['service_date'] = _serviceDateController.text;
      request.fields['status'] = _statusController.text;

      if (_file != null) {
        request.files.add(await http.MultipartFile.fromPath('urlFile', _file!.path));
      }

      try {
        var response = await request.send();
        if (response.statusCode == 200) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Expediente creado exitosamente')),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error al crear expediente')),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error en la conexión')),
        );
      }
    }
  }

  Future<void> pickFile() async {
    // Aquí puedes implementar la lógica para seleccionar un archivo
    // Por ejemplo, usando el paquete 'file_picker'
    // _file = await FilePicker.getFile();
  }

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

    if (selectedDate != null) {
      setState(() {
        _serviceDateController.text = "${selectedDate.toLocal()}".split(' ')[0]; // Formato YYYY-MM-DD
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
            Navigator.pop(context); // Regresar a la pantalla anterior
          },
        ),
        title: const Text('Expediente'),
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
                    'Crear Expediente',
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
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // Número de carta
                      _buildTextFormField(_letterNumberController, 'Número de carta'),
                      // ID del doctor
                      _buildDoctorAutocomplete(),                      // Compañía de seguros con Autocomplete
                      _buildInsuranceAutocomplete(),
                      // ID del paciente
                      _buildPatientAutocomplete(),
                      // Fecha del servicio
                      GestureDetector(
                        onTap: () => _selectDate(context),
                        child: AbsorbPointer(
                          child: _buildDateField(),
                        ),
                      ),
                      // Estado
                      // Selección de archivo
                      ElevatedButton(
                        onPressed: pickFile,
                        child: Text('Seleccionar archivo'),
                      ),
                      const SizedBox(height: 20),
                      // Botón de crear expediente
                      ElevatedButton(
                        onPressed: createExpediente,
                        child: const Text('Crear Expediente'),
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

  Widget _buildDoctorAutocomplete() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
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
        child: Autocomplete<String>(
          optionsBuilder: (TextEditingValue textEditingValue) {
            return _doctorNames.where((name) =>
                name.toLowerCase().contains(textEditingValue.text.toLowerCase()));
          },
          onSelected: (String selection) {
            setState(() {
              final selectedDoctor = _doctors.firstWhere(
                  (doctor) =>
                      '${doctor["first_name"]} ${doctor["last_name"]}' ==
                      selection);
              _doctorIdController.text = selectedDoctor["doctor_id"].toString();
            });
          },
          fieldViewBuilder: (BuildContext context,
              TextEditingController fieldTextController,
              FocusNode fieldFocusNode,
              VoidCallback onFieldSubmitted) {
            return TextFormField(
              controller: fieldTextController,
              focusNode: fieldFocusNode,
              decoration: InputDecoration(
                labelText: 'Doctor',
                labelStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              ),
            );
          },
        ),
      ),
    );
  }

 Widget _buildPatientAutocomplete() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Container(
      width: MediaQuery.of(context).size.width * 0.8, // Consistencia con otros inputs
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
      child: Autocomplete<String>(
        optionsBuilder: (TextEditingValue textEditingValue) {
          return _patientNames.where((name) =>
              name.toLowerCase().contains(textEditingValue.text.toLowerCase()));
        },
        onSelected: (String selection) {
          setState(() {
            _patientNameController.text = selection;
            final selectedPatient = _patients.firstWhere(
                (patient) =>
                    '${patient["first_name"]} ${patient["last_name"]}' ==
                    selection);
            _patientIdController.text = selectedPatient["patient_id"].toString();
          });
        },
        fieldViewBuilder: (BuildContext context,
            TextEditingController fieldTextController,
            FocusNode fieldFocusNode,
            VoidCallback onFieldSubmitted) {
          return TextFormField(
            controller: fieldTextController,
            focusNode: fieldFocusNode,
            decoration: InputDecoration(
              labelText: 'Paciente',
              labelStyle: TextStyle(color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            ),
          );
        },
      ),
    ),
  );
}

  Widget _buildInsuranceAutocomplete() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Autocomplete<String>(
        optionsBuilder: (TextEditingValue textEditingValue) {
          return _insuranceCompanies.where((company) => company.toLowerCase().contains(textEditingValue.text.toLowerCase()));
        },
        onSelected: (String selection) {
          setState(() {
            _insuranceIdController.text = selection;
          });
        },
        fieldViewBuilder: (BuildContext context, TextEditingController fieldTextController, FocusNode fieldFocusNode, VoidCallback onFieldSubmitted) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
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
                controller: fieldTextController,
                focusNode: fieldFocusNode,
                decoration: InputDecoration(
                  labelText: 'Compañía de seguros',
                  labelStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildDateField() {
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
          controller: _serviceDateController,
          decoration: InputDecoration(
            labelText: 'Fecha de servicio',
            labelStyle: TextStyle(color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          ),
          readOnly: true,
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

  Widget _buildTextFormField(TextEditingController controller, String label) {
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
}
