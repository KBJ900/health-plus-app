import 'package:diet_recipe_app/doctor/view_doctor/registros/view/compa%C3%B1ia_screen.dart';
import 'package:flutter/material.dart';
import 'package:diet_recipe_app/doctor/view_doctor/registros/view/expedientes_screen.dart';
import 'package:diet_recipe_app/doctor/view_doctor/registros/view/pacientes_screen.dart';

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
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            // Encabezado
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 11, 103, 116),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(20),
                alignment: Alignment.center,
                child: Column(
                  children: const [
                    Text(
                      'Seguros',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),

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
                  'Crea tus Registros',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            // Cards
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: [
                    _buildCard(
                      context,
                      'Expediente',
                      Icons.folder_open,
                      const Color.fromARGB(255, 87, 122, 6),
                      CreateExpedientes(),
                    ),
                    _buildCard(
                      context,
                      'Crear Plan',
                      Icons.add_chart,
                      const Color.fromARGB(255, 6, 122, 55),
                      null, // Reemplaza con tu vista para "Crear Plan"
                    ),
                    _buildCard(
                      context,
                      'Paciente',
                      Icons.person,
                      const Color.fromARGB(255, 136, 76, 8),
                      CreatePacientes(),
                    ),
                    _buildCard(
                      context,
                      'Compañía',
                      Icons.business,
                      const Color.fromARGB(255, 6, 90, 116),
                      CreateCompania(),
                    ),
                    const SizedBox(height: 15),
                    // Botón Planes de Alimentación
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: ElevatedButton(
                        onPressed: () {
                          // Navegar a la pantalla de Planes de Alimentación
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CreateMealPlan(), // Navegar a la vista
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
                          'Planes de Alimentación',
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

  Widget _buildCard(BuildContext context, String title, IconData icon, Color color, Widget? targetScreen) {
    return GestureDetector(
      onTap: () {
        if (targetScreen != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => targetScreen),
          );
        }
      },
      child: Card(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 40,
              color: Colors.white,
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
