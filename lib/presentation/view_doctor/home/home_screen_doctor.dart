import 'package:flutter/material.dart';
import 'package:diet_recipe_app/core/app_export.dart';
import 'package:diet_recipe_app/data/listdata/app_listdata.dart';
import 'package:diet_recipe_app/data/pref_data/pref_data.dart';
import 'package:diet_recipe_app/presentation/home_screen_page/widget/healthy_food_menu_banner.dart';
import 'package:diet_recipe_app/presentation/home_screen_page/widget/home_option.dart';
import 'package:diet_recipe_app/presentation/home_screen_page/widget/running_card.dart';
import 'package:diet_recipe_app/presentation/home_screen_page/widget/what_lunch_container.dart';
import 'package:diet_recipe_app/presentation/recommendations_screen/controller/recommendations_controller.dart';

// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class HomeScreenDoctor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bienvenida"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Título de bienvenida que se ajusta al tamaño del dispositivo
            Text(
              '¡Bienvenido a Health+!',
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.08, // Se ajusta según el tamaño de la pantalla
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            
            // Botón verde con esquinas redondeadas
            ElevatedButton(
              onPressed: () {
                // Acción que se ejecuta al presionar el botón
                print('Hola');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Usar backgroundColor en lugar de primary
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30), // Bordes redondeados
                ),
              ),
              child: Text(
                '¡Hola!',
                style: TextStyle(color: Colors.white), // Texto del botón
              ),
            ),
          ],
        ),
      ),
    );
  }
}
