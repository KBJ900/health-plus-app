import 'package:flutter/material.dart';

class HomeDoctorPage extends StatelessWidget {
  HomeDoctorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Datos de ejemplo para la lista de usuarios
    final List<Map<String, String>> users = List.generate(20, (index) {
      return {
        'name': 'Expediente $index',
        'email': 'Expedient$index@example.com',
      };
    });

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
          'Bienvenido',
          style: TextStyle(
            color: Colors.white, // Texto en blanco para contraste
            fontSize: 28,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 10), // Espaciado entre textos
        Text(
          'Test doctor',
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
      'Lista de Expedientes', // Subtítulo
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.white, // Texto en blanco para contraste
      ),
    ),
  ),
),

          // Lista de usuarios con un scroll
          Expanded(
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white, // Fondo blanco tenue
                    borderRadius: BorderRadius.circular(15), // Bordes redondeados
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26, // Sombra tenue
                        offset: Offset(0, 2),
                        blurRadius: 6,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: const Color.fromARGB(255, 25, 142, 150),
                        child: Text(
                          user['name']![0], // Primer letra del nombre
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user['name']!,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            user['email']!,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
