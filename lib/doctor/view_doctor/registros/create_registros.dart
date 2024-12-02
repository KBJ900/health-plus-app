import 'package:diet_recipe_app/doctor/view_doctor/registros/view/expedientes_screen.dart';
import 'package:diet_recipe_app/doctor/view_doctor/registros/view/pacientes_screen.dart';
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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'), // Ruta de la imagen
            fit: BoxFit.cover, // Asegura que la imagen cubra todo el fondo
          ),
        ),
        child: Column(
          children: [
            // Encabezado
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 11, 103, 116), // Fondo verde con opacidad
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
                      'Seguros',
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

            // Subtítulo
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 11, 103, 116), // Fondo verde con opacidad
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
            Expanded(  // Usar Expanded para distribuir el espacio mejor
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: [
                    // Botón Expediente
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: ElevatedButton(
                        onPressed: () {
                          // Navegar a la pantalla de Expedientes
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CreateExpedientes(), // Navegar a la vista
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 6, 122, 55),
                          minimumSize: const Size(double.infinity, 60), // Altura fija de 60 px
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
                    ),
                    const SizedBox(height: 15),
                    // Botón Paciente
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: ElevatedButton(
                        onPressed: () {
                          // Navegar a la pantalla de Expedientes
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CreatePacientes(), // Navegar a la vista
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 136, 76, 8),
                          minimumSize: const Size(double.infinity, 60), // Altura fija de 60 px
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
                    ),
                    const SizedBox(height: 15),
                    // Botón Compañía
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: ElevatedButton(
                        onPressed: () {
                          print("Botón Compañía presionado");
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 6, 90, 116),
                          minimumSize: const Size(double.infinity, 60), // Altura fija de 60 px
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
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
