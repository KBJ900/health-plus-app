import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CreateMealPlan extends StatefulWidget {
  const CreateMealPlan({Key? key}) : super(key: key);

  @override
  _CreateMealPlanState createState() => _CreateMealPlanState();
}

class _CreateMealPlanState extends State<CreateMealPlan> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _patientController = TextEditingController();

  List<Map<String, dynamic>> _patients = [];
  List<String> _patientNames = [];
  List<Map<String, dynamic>> _foods = [];
  List<String> _foodNames = [];
  List<int> _selectedFoodIds = [];

  @override
  void initState() {
    super.initState();
    _fetchPatients();
    _fetchFoods();
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
              .map((patient) => '${patient["first_name"]} ${patient["last_name"]}')
              .toList();
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al cargar los pacientes')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error en la conexión al cargar los pacientes')),
      );
    }
  }

  Future<void> _fetchFoods() async {
    final url = Uri.parse('https://health-back-lingering-wave-8458.fly.dev/api/mealPlanRoutes/foods');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        setState(() {
          _foods = (data['foods'] as List<dynamic>).map((item) => item as Map<String, dynamic>).toList();
          _foodNames = _foods.map((food) => food['name'] as String).toList();
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al cargar las comidas')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error en la conexión al cargar las comidas')),
      );
      print('Error al cargar las comidas: $e');
    }
  }

  Future<void> _createMealPlan() async {
    if (_formKey.currentState!.validate()) {
      final url = Uri.parse('https://health-back-lingering-wave-8458.fly.dev/api/mealPlanRoutes/meal-plan');
      final body = {
        'name': _nameController.text,
        'description': _descriptionController.text,
        'patient_id': _patients.firstWhere((patient) => '${patient["first_name"]} ${patient["last_name"]}' == _patientController.text)['patient_id'],
        'foods': _selectedFoodIds.map((id) => {'foodId': id}).toList(),
      };

      print('Enviando datos: $body'); // Mostrar en consola los datos enviados

      try {
        final response = await http.post(url, body: json.encode(body), headers: {'Content-Type': 'application/json'});
        if (response.statusCode == 200) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Plan de alimentación creado exitosamente')),
          );
          Navigator.pop(context); // Regresar a la pantalla anterior
        } else {
          Navigator.pop(context); // Regresar a la pantalla anterior
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error en la conexión al crear el plan de alimentación')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 11, 103, 116),
        title: const Text('Crear Plan de Alimentación'),
      ),
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
                    'Crear Plan de Alimentación',
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
                      _buildPatientAutocomplete(),
                      _buildTextFormField(_nameController, 'Nombre del plan'),
                      _buildTextFormField(_descriptionController, 'Descripción'),
                      const SizedBox(height: 20),
                      const Text(
                        'Seleccionar comidas',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      _buildFoodCheckboxes(),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: ElevatedButton(
                          onPressed: _createMealPlan,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 6, 122, 55),
                            minimumSize: const Size(double.infinity, 60), // Altura fija de 60 px
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            'Guardar',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
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

  Widget _buildPatientAutocomplete() {
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
            return _patientNames.where((name) =>
                name.toLowerCase().contains(textEditingValue.text.toLowerCase()));
          },
          onSelected: (String selection) {
            setState(() {
              _patientController.text = selection;
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

  Widget _buildFoodCheckboxes() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: _foods.map((food) {
              return CheckboxListTile(
                title: Text(
                  food['name'],
                  style: TextStyle(color: Colors.black), // Cambiar el color del texto a negro
                ),
                value: _selectedFoodIds.contains(food['food_id']),
                onChanged: (bool? selected) {
                  setState(() {
                    if (selected == true) {
                      _selectedFoodIds.add(food['food_id']);
                    } else {
                      _selectedFoodIds.remove(food['food_id']);
                    }
                  });
                },
                controlAffinity: ListTileControlAffinity.leading, // Asegura que el checkbox esté a la izquierda del texto
                activeColor: Colors.green, // Color del checkbox cuando está seleccionado
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}