import 'package:flutter/material.dart';

class CreateRegistro extends StatefulWidget {
  const CreateRegistro({Key? key}) : super(key: key);

  @override
  _CreateRegistroState createState() => _CreateRegistroState();
}

class _CreateRegistroState extends State<CreateRegistro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // Color de fondo general
      body: Column(
        children: [
          // Encabezado
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 11, 103, 116), // Fondo verde personalizado
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20), // Esquinas inferiores redondeadas
                  bottomRight: Radius.circular(20),
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26, // Sombra ligera
                    blurRadius: 10, // Difuminación de la sombra
                    offset: Offset(0, 5), // Desplazamiento de la sombra
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
                    'Crear Registros',
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

          // Subtítulo
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 11, 103, 116), // Fondo verde personalizado
                borderRadius: BorderRadius.circular(10), // Esquinas redondeadas
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26, // Sombra ligera
                    blurRadius: 5, // Difuminación de la sombra
                    offset: Offset(0, 3), // Desplazamiento de la sombra
                  ),
                ],
              ),
              padding: const EdgeInsets.all(10), // Espaciado interno
              alignment: Alignment.center, // Centrar el texto
              child: const Text(
                'Crea tus Registros', // Subtítulo
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white, // Texto en blanco para contraste
                ),
              ),
            ),
          ),

          // Botones: Expediente, Paciente, Compañía
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Acción del botón Expediente
                    print("Botón Expediente presionado");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 11, 103, 116),
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Expediente',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {
                    // Acción del botón Paciente
                    print("Botón Paciente presionado");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 11, 103, 116),
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Paciente',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {
                    // Acción del botón Compañía
                    print("Botón Compañía presionado");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 11, 103, 116),
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Compañía',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
