// =============================
// 🟩 SECCIÓN: Importaciones
// =============================
import 'package:flutter/material.dart';
import '../../../services/patient_service.dart';

// =============================
// 🟩 SECCIÓN: Clase Principal - PacienteScreen
// =============================
class PacienteScreen extends StatefulWidget {
  final Map<String, dynamic> patient;

  const PacienteScreen({Key? key, required this.patient}) : super(key: key);

  @override
  _PacienteScreenState createState() => _PacienteScreenState();
}

// =============================
// 🟩 SECCIÓN: Estado del Widget - _PacienteScreenState
// =============================
class _PacienteScreenState extends State<PacienteScreen> {
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _emailController;
  late TextEditingController _idController;

  final PatientService _patientService = PatientService(); // Instancia del servicio
  bool _isEditing = false; // Controla si los campos son editables
  bool _isLoading = false; // Controla el estado de carga

  // =============================
// 🟩 SECCIÓN: Inicialización de Controladores
// =============================
  @override
  void initState() {
    super.initState();
    // Inicializar los controladores con la información del paciente.
    _idController = TextEditingController(text: widget.patient['patient_id'].toString());
    _firstNameController = TextEditingController(text: widget.patient['first_name']);
    _lastNameController = TextEditingController(text: widget.patient['last_name']);
    _emailController = TextEditingController(text: widget.patient['email']);
  }

  // =============================
// 🟩 SECCIÓN: Liberación de Recursos
// =============================
  @override
  void dispose() {
    // Liberar los controladores cuando la pantalla se cierre.
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  // =============================
// 🟩 SECCIÓN: Función para Guardar Información del Paciente
// =============================
  Future<void> _savePatientInfo() async {
    final updatedPatient = {
      'first_name': _firstNameController.text,
      'last_name': _lastNameController.text,
      'email': _emailController.text,
    };

    setState(() {
      _isLoading = true; // Muestra un indicador de carga.
    });

    try {
      // Llamada al servicio para actualizar al paciente.
      await _patientService.editPatient(
        int.parse(_idController.text), // Asegúrate de convertir a entero.
        updatedPatient,
      );

      setState(() {
        widget.patient.addAll(updatedPatient); // Actualiza localmente los datos.
        _isEditing = false; // Desactiva la edición después de guardar.
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Información actualizada exitosamente!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al actualizar: $e')),
      );
    } finally {
      setState(() {
        _isLoading = false; // Oculta el indicador de carga.
      });
    }
  }

  // =============================
// 🟩 SECCIÓN: Activar Edición de Campos
// =============================
  void _enableEditing() {
    setState(() {
      _isEditing = true; // Habilitar la edición.
    });
  }

  // =============================
// 🟩 SECCIÓN: Construcción del UI
// =============================
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles del Paciente'),
        backgroundColor: const Color.fromARGB(255, 11, 103, 116),
      ),
      body: Stack(
        children: [
          // =============================
// 🟩 SECCIÓN: Imagen de Fondo
// =============================
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.jpg', // Ruta de la imagen de fondo
              fit: BoxFit.cover,
            ),
          ),

          // =============================
// 🟩 SECCIÓN: Contenedor con Efecto Cristal
// =============================
          Center(
            child: Container(
              height: screenHeight * 0.6, // Ajusta la altura del contenedor
              width: screenWidth * 0.8, // Ajusta el ancho del contenedor
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.7), // Fondo semi-transparente
                borderRadius: BorderRadius.circular(20), // Bordes redondeados
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // =============================
// 🟩 SECCIÓN: Icono del Paciente
// =============================
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: const Color.fromARGB(255, 25, 142, 150),
                    child: const Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // =============================
// 🟩 SECCIÓN: Información del Paciente
// =============================
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        TextField(
                          controller: _idController,
                          decoration: InputDecoration(
                            labelText: 'ID del Paciente',
                            labelStyle: TextStyle(
                              color: _isEditing ? Colors.green : Colors.black,
                            ),
                          ),
                          enabled: false,
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          controller: _firstNameController,
                          decoration: InputDecoration(
                            labelText: 'Nombre',
                            labelStyle: TextStyle(
                              color: _isEditing ? Colors.green : Colors.black,
                            ),
                          ),
                          enabled: _isEditing,
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          controller: _lastNameController,
                          decoration: InputDecoration(
                            labelText: 'Apellido',
                            labelStyle: TextStyle(
                              color: _isEditing ? Colors.green : Colors.black,
                            ),
                          ),
                          enabled: _isEditing,
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            labelText: 'Correo Electrónico',
                            labelStyle: TextStyle(
                              color: _isEditing ? Colors.green : Colors.black,
                            ),
                          ),
                          enabled: _isEditing,
                        ),
                        const SizedBox(height: 20),

                        // =============================
// 🟩 SECCIÓN: Botón para Guardar o Editar
// =============================
// Botón para Guardar o Editar
_isEditing
  ? ElevatedButton(
      onPressed: _savePatientInfo,
      child: _isLoading
          ? const CircularProgressIndicator(
              color: Colors.white,
            )
          : const Expanded(
              child: Text(
                'Guardar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis, // Evita que el texto se desborde
                ),
              ),
            ),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 11, 103, 116),
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1), // 80% de ancho
        fixedSize: Size(screenWidth * 0.8, 40), // 80% de ancho y 40px de altura
      ),
    )
  : ElevatedButton(
      onPressed: _enableEditing,
      child: const Text(
        'Editar',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
          overflow: TextOverflow.ellipsis, // Evita que el texto se desborde
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 11, 103, 116),
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1), // 80% de ancho
        fixedSize: Size(screenWidth * 0.8, 40), // 80% de ancho y 40px de altura
      ),
    )

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
