// =============================
// 🟩 SECCIÓN: Importación de librerías y servicios
// =============================

import 'package:flutter/material.dart';
import '../../../../services/patient_service.dart'; // Servicio para obtener la lista de pacientes
import '../../list_pacientes/pacientes_screen.dart'; // Pantalla de detalles de un paciente

// =============================
// 🟩 SECCIÓN: Definición de la clase ListPacientes
// =============================

class ListPacientes extends StatefulWidget {
  const ListPacientes({Key? key}) : super(key: key);

  @override
  _ListPacientesState createState() => _ListPacientesState();
}

// =============================
// 🟩 SECCIÓN: Estado de la clase ListPacientes
// =============================

class _ListPacientesState extends State<ListPacientes>
    with SingleTickerProviderStateMixin {
  
  final PatientService _patientService = PatientService(); // Instancia del servicio de pacientes
  late Future<List<Map<String, dynamic>>> _futurePatients; // Variable para los pacientes futuros
  late AnimationController _controller; // Controlador de animación
  TextEditingController _searchController = TextEditingController(); // Controlador para la búsqueda
  String _searchQuery = ''; // Query de búsqueda

  @override
  void initState() {
    super.initState();
    _futurePatients = _patientService.getPatients(); // Llama al servicio para obtener los pacientes
    _controller = AnimationController( // Inicializa el controlador de animaciones
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    // Escuchar cambios en el campo de búsqueda y actualizar el estado
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _controller.dispose(); // Libera el controlador de animaciones
    _searchController.removeListener(_onSearchChanged); // Elimina el listener cuando se destruye el widget
    _searchController.dispose(); // Libera el controlador de búsqueda
    super.dispose();
  }

  // Método que se llama cuando cambia el texto de búsqueda
  void _onSearchChanged() {
    setState(() {
      _searchQuery = _searchController.text.toLowerCase(); // Actualiza la query de búsqueda
    });
  }

  // =============================
// 🟩 SECCIÓN: Construcción de la UI (Interfaz de Usuario)
// =============================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // Color de fondo general
      body: Stack(  // Usa un Stack para superponer el fondo de la imagen y la UI
        children: [
          // =============================
// 🟩 SECCIÓN: Fondo de imagen
// =============================

          Positioned.fill(
            child: Image.asset(
              'assets/images/background.jpg',
              fit: BoxFit.cover,
            ),
          ),

          // =============================
// 🟩 SECCIÓN: Contenido principal
// =============================

          Column(
            children: [
              // =============================
// 🟩 SECCIÓN: Título de la pantalla
// =============================

              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 11, 103, 116), // Fondo verde personalizado
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20), // Esquinas inferiores redondeadas
                      bottomRight: Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26, // Sombra ligera
                        blurRadius: 10, // Difuminación de la sombra
                        offset: const Offset(0, 5), // Desplazamiento de la sombra
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(20), // Espaciado interno
                  alignment: Alignment.center, // Centrar el contenido
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        'Pacientes',
                        style: TextStyle(
                          color: Colors.white, // Texto en blanco para contraste
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 10), // Espaciado entre textos
                    ],
                  ),
                ),
              ),

              // =============================
// 🟩 SECCIÓN: Subtítulo de la lista de pacientes
// =============================

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 11, 103, 116), // Fondo verde personalizado
                    borderRadius: BorderRadius.circular(10), // Esquinas redondeadas
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26, // Sombra ligera
                        blurRadius: 5, // Difuminación de la sombra
                        offset: const Offset(0, 3), // Desplazamiento de la sombra
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(10), // Espaciado interno
                  alignment: Alignment.center, // Centrar el texto
                  child: const Text(
                    'Lista de Pacientes', // Subtítulo
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white, // Texto en blanco para contraste
                    ),
                  ),
                ),
              ),


                // =============================
// 🟩 SECCIÓN: Barra de búsqueda
// =============================

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Material(
                    elevation: 4,
                    borderRadius: BorderRadius.circular(34),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(34),
                      child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          hintText: 'Buscar por nombre o email...',
                          hintStyle: TextStyle(
                            color: Colors.grey[600],
                          ),
                          prefixIcon: const Icon(Icons.search),
                          border: InputBorder.none,
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.symmetric(vertical: 15),
                        ),
                      ),
                    ),
                  ),
                ),

              // =============================
// 🟩 SECCIÓN: Carga y visualización de la lista de pacientes
// =============================

              Expanded(
                child: FutureBuilder<List<Map<String, dynamic>>>( // FutureBuilder para obtener los pacientes
                  future: _futurePatients,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator()); // Cargando
                    } else if (snapshot.hasError) {
                      return Center(child: Text("Error: ${snapshot.error}")); // Error de conexión
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(child: Text("No hay pacientes disponibles")); // No hay datos
                    }

                    final patients = snapshot.data!
                        .where((patient) =>
                            patient['first_name']
                                .toLowerCase()
                                .contains(_searchQuery) ||
                            patient['last_name']
                                .toLowerCase()
                                .contains(_searchQuery) ||
                            patient['email']
                                .toLowerCase()
                                .contains(_searchQuery))
                        .toList(); // Filtrar por búsqueda

                    return ListView.builder(
                      itemCount: patients.length,
                      itemBuilder: (context, index) {
                        final patient = patients[index]; // Paciente individual
                        return GestureDetector(
                          onTap: () {
                            // Navega a la vista de detalles de paciente
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PacienteScreen(patient: patient),
                              ),
                            );
                          },
                          child: AnimatedBuilder( // Animación para la lista
                            animation: _controller,
                            builder: (context, child) {
                              final rotation = _controller.value * 2 * 3.1416; // Giro completo
                              return Transform(
                                transform: Matrix4.rotationY(rotation),
                                alignment: Alignment.center,
                                child: child,
                              );
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    offset: const Offset(0, 2),
                                    blurRadius: 6,
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundColor: const Color.fromARGB(255, 25, 142, 150),
                                    child: const Icon(
                                      Icons.person,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
                                  const SizedBox(width: 15),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${patient['first_name']} ${patient['last_name']} ", // Nombre del paciente
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        patient['email'], // Correo electrónico del paciente
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
