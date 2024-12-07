import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class ChooseYourPlanStandardTabContainerScreen extends StatefulWidget {
  const ChooseYourPlanStandardTabContainerScreen({Key? key}) : super(key: key);

  @override
  _ChooseYourPlanStandardTabContainerScreenState createState() =>
      _ChooseYourPlanStandardTabContainerScreenState();
}

class _ChooseYourPlanStandardTabContainerScreenState
    extends State<ChooseYourPlanStandardTabContainerScreen> {
  List<Food> foods = [
    Food(
      name: 'Frutas Frescas',
      image: 'assets/images/frutas.jpg',
      info: 'Las frutas frescas son ricas en vitaminas, fibra y antioxidantes, perfectas para una dieta saludable.',
    ),
    Food(
      name: 'Yogur Natural',
      image: 'assets/images/yogur.jpg',
      info: 'El yogur natural es una fuente excelente de calcio y probióticos que ayudan a la digestión y salud ósea.',
    ),
    Food(
      name: 'Verduras al Vapor',
      image: 'assets/images/verduras_vapor.jpg',
      info: 'Las verduras al vapor conservan más nutrientes y son bajas en calorías, ayudando a mantener un peso saludable.',
    ),
    Food(
      name: 'Aguacate',
      image: 'assets/images/aguacate.jpg',
      info: 'El aguacate es una excelente fuente de grasas saludables, fibra y vitaminas que ayudan a la energía y el corazón.',
    ),
    Food(
      name: 'Pechuga de Pollo',
      image: 'assets/images/pechuga.jpg',
      info: 'La pechuga de pollo es rica en proteínas y baja en grasa, ideal para el desarrollo muscular y la salud en general.',
    ),
    Food(
      name: 'Pescado a la Parrilla',
      image: 'assets/images/pescado.jpg',
      info: 'El pescado es una fuente de ácidos grasos omega-3, importantes para la salud del cerebro y el sistema cardiovascular.',
    ),
  ];

  List<bool> flipped = [];

  @override
  void initState() {
    super.initState();
    flipped = List<bool>.filled(foods.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'), // Imagen de fondo
            fit: BoxFit.cover,  // Asegura que la imagen cubra toda la pantalla
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Título "Recomendaciones"
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                color: Colors.green,  // Fondo verde para el Card
                elevation: 4.0,        // Sombra para darle un poco de profundidad
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0), // Bordes redondeados
                ),
                child: Container(
                  alignment: Alignment.center,  // Centra el título
                  padding: const EdgeInsets.symmetric(vertical: 16.0),  // Añadir padding vertical para más espacio
                  child: Text(
                    'Recomendaciones', // Título
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,  // Texto en blanco
                    ),
                  ),
                ),
              ),
            ),

            // Contenedor con GridView
            Expanded(
              child: Container(
                color: Colors.white.withOpacity(0.7),  // Fondo blanco con opacidad para asegurar que las tarjetas sean legibles
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,  // Dos columnas
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: 1,  // Hace que las tarjetas tengan proporciones cuadradas
                  ),
                  itemCount: foods.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        _showFoodInfoDialog(context, index); // Mostrar la ventana emergente
                      },
                      child: AnimatedSwitcher(
                        duration: Duration(milliseconds: 500),
                        child: Card(
                          key: ValueKey('card_$index'),
                          elevation: 8.0,
                          color: Colors.green[300],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0), // Bordes redondeados
                          ),
                          child: Container(
                            width: 150,  // Tamaño fijo en ambas direcciones para hacer el cuadrado
                            height: 180, // Ajustamos la altura para hacer espacio para la imagen más grande
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0),
                              color: Colors.white.withOpacity(0.1), // Fondo con opacidad
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                // Imagen más grande en la parte superior
                                ClipRRect(
                                  borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
                                  child: Image.asset(
                                    foods[index].image,
                                    height: 100, // Imagen más grande
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.4), // Fondo opaco sin el efecto de cristal
                                      borderRadius: BorderRadius.vertical(bottom: Radius.circular(16.0)),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        foods[index].name,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Función para mostrar la ventana emergente con la información
  void _showFoodInfoDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 500),
            padding: EdgeInsets.all(16.0),
            height: 300, // Ajusta la altura según el contenido
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  foods[index].name,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                Image.asset(
                  foods[index].image,
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 16),
                Text(
                  foods[index].info,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class Food {
  final String name;
  final String image;
  final String info;

  Food({required this.name, required this.image, required this.info});
}
