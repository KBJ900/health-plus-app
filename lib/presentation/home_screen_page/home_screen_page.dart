import 'package:flutter/material.dart';
import 'package:diet_recipe_app/core/app_export.dart';
import 'package:diet_recipe_app/presentation/recommendations_screen/controller/recommendations_controller.dart';
import 'controller/home_screen_controller.dart';
import 'models/home_screen_model.dart';

// ignore_for_file: must_be_immutable
class HomeScreenPage extends StatelessWidget {
  HomeScreenPage({Key? key}) : super(key: key);

  HomeScreenController controller = Get.put(HomeScreenController(HomeScreenModel().obs));
  RecommendationsController recommendationsController = Get.put(RecommendationsController());

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    // =============================
// 🟦 SECCIÓN: Estructura general
// =============================
    return Scaffold(
      body: Stack(
        children: [
          // Fondo con imagen
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // Contenedor con el texto y card
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Titulo "Bienvenido"
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Bienvenido',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.black.withOpacity(0.5),
                        offset: Offset(5.0, 5.0),
                      ),
                    ],
                  ),
                ),
              ),
              // Espacio flexible entre el título y la imagen
              SizedBox(height: 20),
              // Card con imagen
              GestureDetector(
                onTapDown: (_) {
                  // Reducción al presionar
                },
                onTapUp: (_) {
                  // Volver al tamaño original
                },
                onTap: () {
                  // Acción al presionar la card
                  print('Card Pressed!');
                },
                child: AnimatedScale(
                  duration: Duration(milliseconds: 200),
                  scale: 1.0,
                  child: Card(
                    elevation: 10,
                    shadowColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.asset(
                        'assets/images/homekidsv2.jpg', // Imagen dentro de la card
                        width: 300,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              // Espacio flexible entre la imagen y la información
              SizedBox(height: 20),
              // Card con información y al 70% del ancho
              Container(
                child: GestureDetector(
                  onTapDown: (_) {
                    // Reducción al presionar
                  },
                  onTapUp: (_) {
                    // Volver al tamaño original
                  },
                  onTap: () {
                    // Acción al presionar la card
                    print('Card Pressed!');
                  },
                  child: AnimatedScale(
                    duration: Duration(milliseconds: 200),
                    scale: 1.0,
                    child: Card(
                      color: Colors.green, // Color verde para la card
                      elevation: 10,
                      shadowColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: ClipRRect(
                        
                        borderRadius: BorderRadius.circular(15.0),
                        child: Padding(
                          
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'Health+ es una aplicación diseñada para combatir el sobrepeso infantil en México, '
                            'enfocándose en la educación y la motivación para un estilo de vida más saludable. '
                            'Ayudamos a los niños a tomar decisiones más saludables mediante un enfoque interactivo y educativo.',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white, // Color blanco para el texto
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                            ),
                            textAlign: TextAlign.justify, // Texto justificado
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
