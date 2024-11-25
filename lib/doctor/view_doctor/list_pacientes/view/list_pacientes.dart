import 'package:flutter/material.dart';
import '../../../../services/patient_service.dart';
import '../../list_pacientes/pacientes_screen.dart'; // Importa la pantalla de detalles del paciente.

class ListPacientes extends StatefulWidget {
  const ListPacientes({Key? key}) : super(key: key);

  @override
  _ListPacientesState createState() => _ListPacientesState();
}

class _ListPacientesState extends State<ListPacientes> {
  final PatientService _patientService = PatientService();
  late Future<List<Map<String, dynamic>>> _futurePatients;

  @override
  void initState() {
    super.initState();
    _futurePatients = _patientService.getPatients();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // Color de fondo general
      body: Column(
        children: [
        Padding(
  padding: EdgeInsets.all(20),
  
  child: Container(
    decoration: BoxDecoration(
            color: const Color.fromARGB(255, 11, 103, 116), // Fondo verde personalizado
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(20), // Esquinas inferiores redondeadas
        bottomRight: Radius.circular(20),
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black26, // Sombra ligera
          blurRadius: 10, // Difuminación de la sombra
          offset: Offset(0, 5), // Desplazamiento de la sombra
        ),
      ],
    ),
    padding: EdgeInsets.all(20), // Espaciado interno
    alignment: Alignment.center, // Centrar el contenido
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Pacientes',
          style: TextStyle(
            color: Colors.white, // Texto en blanco para contraste
            fontSize: 28,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 10), // Espaciado entre textos
        Text(
          '',
          style: TextStyle(
            color: Colors.white70, // Texto ligeramente más claro
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    ),
  ),
),

    // Subtítulo "Lista de Expedientes"
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
              offset: Offset(0, 3), // Desplazamiento de la sombra
            ),
          ],
        ),
        padding: EdgeInsets.all(10), // Espaciado interno
        alignment: Alignment.center, // Centrar el texto
        child: Text(
          'Lista de Pacientes', // Subtítulo
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white, // Texto en blanco para contraste
          ),
        ),
      ),
    ),
          Expanded(
            child: FutureBuilder<List<Map<String, dynamic>>>(
              future: _futurePatients,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text("Error: ${snapshot.error}"));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text("No hay pacientes disponibles"));
                }

                final patients = snapshot.data!;

                return ListView.builder(
                  itemCount: patients.length,
                  itemBuilder: (context, index) {
                    final patient = patients[index];
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
                                  "${patient['first_name']} ${patient['last_name']} ",
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  patient['email'],
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
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
