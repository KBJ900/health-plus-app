import 'package:flutter/material.dart';

class PacienteScreen extends StatefulWidget {
  final Map<String, dynamic> patient;

  const PacienteScreen({Key? key, required this.patient}) : super(key: key);

  @override
  _PacienteScreenState createState() => _PacienteScreenState();
}

class _PacienteScreenState extends State<PacienteScreen> {
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _emailController;
  late TextEditingController _idController;

  bool _isEditing = false; // Controla si los campos son editables

  @override
  void initState() {
    super.initState();
    // Inicializar los controladores con la información del paciente.
    _idController = TextEditingController(text: widget.patient['patient_id'].toString()); // Convertimos a String
    _firstNameController = TextEditingController(text: widget.patient['first_name']);
    _lastNameController = TextEditingController(text: widget.patient['last_name']);
    _emailController = TextEditingController(text: widget.patient['email']);
  }

  @override
  void dispose() {
    // Liberar los controladores cuando la pantalla se cierre.
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _savePatientInfo() {
    // Guardar la información modificada.
    setState(() {
      widget.patient['first_name'] = _firstNameController.text;
      widget.patient['last_name'] = _lastNameController.text;
      widget.patient['email'] = _emailController.text;
      _isEditing = false; // Después de guardar, deshabilitar la edición.
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Información guardada exitosamente!')),
    );
  }

  void _enableEditing() {
    setState(() {
      _isEditing = true; // Habilitar la edición.
    });
  }

  @override
  Widget build(BuildContext context) {
    // Obtener el tamaño de la pantalla
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles del Paciente'),
        backgroundColor: const Color.fromARGB(255, 11, 103, 116),
      ),
      body: Container(
        color: Colors.white, // Fondo blanco para la pantalla
        width: double.infinity, // Asegura que el contenedor ocupe todo el ancho disponible
        height: screenHeight, // Hace que el contenedor ocupe toda la altura disponible
        padding: const EdgeInsets.all(20), // Padding alrededor del contenedor
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Círculo con icono de perfil en la parte superior centrado
              Padding(
                padding: const EdgeInsets.only(bottom: 20), // Espacio inferior
                child: CircleAvatar(
                  radius: 50, // Tamaño del círculo
                  backgroundColor: const Color.fromARGB(255, 25, 142, 150),
                  child: const Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 50, // Tamaño del icono dentro del círculo
                  ),
                ),
              ),
              // Contenedor con la información del paciente
              Container(
                decoration: BoxDecoration(
                  color: Colors.white, // Fondo blanco para el contenedor de información
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ID del Paciente
                    TextField(
                      controller: _idController,
                      decoration: InputDecoration(
                        labelText: 'ID del Paciente',
                        labelStyle: TextStyle(
                          color: _isEditing ? Colors.green : Colors.black, // Cambio de color si está en edición
                        ),
                      ),
                      enabled: false, // El ID no es editable
                    ),
                    const SizedBox(height: 10),
                    // Nombre
                    TextField(
                      controller: _firstNameController,
                      decoration: InputDecoration(
                        labelText: 'Nombre',
                        labelStyle: TextStyle(
                          color: _isEditing ? Colors.green : Colors.black, // Cambio de color a verde si está en edición
                        ),
                      ),
                      enabled: _isEditing, // Solo editable si _isEditing es true
                    ),
                    const SizedBox(height: 10),
                    // Apellido
                    TextField(
                      controller: _lastNameController,
                      decoration: InputDecoration(
                        labelText: 'Apellido',
                        labelStyle: TextStyle(
                          color: _isEditing ? Colors.green : Colors.black, // Cambio de color a verde si está en edición
                        ),
                      ),
                      enabled: _isEditing, // Solo editable si _isEditing es true
                    ),
                    const SizedBox(height: 10),
                    // Email
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Correo Electrónico',
                        labelStyle: TextStyle(
                          color: _isEditing ? Colors.green : Colors.black, // Cambio de color a verde si está en edición
                        ),
                      ),
                      enabled: _isEditing, // Solo editable si _isEditing es true
                    ),
                    const SizedBox(height: 20),
                    // Si estamos editando, mostrar el botón "Guardar", si no, mostrar el botón "Editar"
                    _isEditing
                        ? Center(
                            child: ElevatedButton(
                              onPressed: _savePatientInfo,
                              child: const Text(
                                'Guardar',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(255, 11, 103, 116),
                                padding: EdgeInsets.symmetric(
                                    horizontal: screenWidth * 0.3, vertical: 28), // Ajustar la altura
                              ),
                            ),
                          )
                        : Center(
                            child: ElevatedButton(
                              onPressed: _enableEditing,
                              child: const Text(
                                'Editar',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(255, 11, 103, 116),
                                padding: EdgeInsets.symmetric(
                                    horizontal: screenWidth * 0.3, vertical: 28), // Ajustar la altura
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
    );
  }
}
