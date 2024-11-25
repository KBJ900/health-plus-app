// =============================
// 🟨 SECCIÓN: Importaciones
// =============================

import 'dart:io'; // Usado para detectar la plataforma, en este caso iOS y Android.

import 'package:flutter/material.dart'; // Paquete de Flutter para crear la UI.
import 'package:diet_recipe_app/core/app_export.dart'; // Importación de configuraciones y temas globales.

import 'package:diet_recipe_app/doctor/view_doctor/home_screen_page/home_doctor_page.dart'; // Pantalla principal.

import 'package:diet_recipe_app/presentation/menu_page/menu_page.dart'; // Pantalla de menú.

import 'package:diet_recipe_app/presentation/menu_tab_container_page/menu_tab_container_page.dart'; // Contenedor de pestañas del menú.
import 'package:diet_recipe_app/presentation/my_plan_page/my_plan_page.dart'; // Pantalla de planes del usuario.
import 'package:diet_recipe_app/presentation/profile_page/profile_page.dart'; // Perfil del usuario.

import 'package:diet_recipe_app/doctor/widgets_doctor/custom_button_app_bar.dart'; // Barra inferior personalizada.
import '../../../data/pref_data/pref_data.dart'; // Datos de preferencias del usuario.
import '../../../generated/assets.dart'; // Recursos generados, como imágenes y activos.
import '../../../presentation/choose_your_plan_standard_tab_container_screen/choose_your_plan_standard_tab_container_screen.dart'; // Pantalla para elegir el plan.
import 'controller/home_screen_container_controller.dart'; // Controlador de la pantalla principal.

import '../list_pacientes/view/list_pacientes.dart';
import '../list_pacientes/view/list_companies.dart';
import '../registros/view/create_registros.dart';

// =============================
// 🟩 SECCIÓN: Definición de clase principal
// =============================

class HomeScreenDoctor extends GetWidget<HomeDoctorContainerController> {
  HomeScreenDoctor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context); // Obtiene datos del tamaño de la pantalla.
    
    return GetBuilder<HomeDoctorContainerController>(builder: (controller) {
      return WillPopScope( // Prevenimos la acción por defecto del botón de retroceso.
        onWillPop: () { 
          if (PrefData.currentIndex == 0) { // Verifica si estamos en la pantalla principal.
            showDialog<String>( // Muestra un cuadro de diálogo para confirmar salida.
              context: context,
              builder: (BuildContext context) => AlertDialog(
                backgroundColor: Colors.white, // Fondo blanco del diálogo.
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(getHorizontalSize(16)))), // Bordes redondeados.
                insetPadding: getPadding(left:16, right: 16), // Espaciado dentro del cuadro de diálogo.
              // =============================
              // 🟩 SECCIÓN: Título del cuadro de diálogo
              // =============================

              title: Padding(
                padding: getPadding(left: getSize(50), right: getSize(50)),
                child: Text(
                  '¿Estás segur@ de que quieres salir?', // Texto que indica si está seguro de salir.
                  style: TextStyle(
                    color: Colors.black, // Texto en negro.
                    fontSize: getFontSize(18), // Tamaño del texto.
                    fontWeight: FontWeight.w600, // Peso del texto.
                  ),
                ),
              ),

              // =============================
              // 🟧 SECCIÓN: Botones del cuadro de diálogo
              // =============================

              actions: <Widget>[
                Row(
                  children: [
                    Expanded(
                      // Botón "No", que cierra el cuadro de diálogo.
                      child: GestureDetector(
                        onTap: () {
                          Get.back(); // Cierra el cuadro de diálogo y vuelve a la pantalla anterior.
                        },
                        child: Padding(
                          padding: getPadding(bottom: 16, left: 16),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8), // Bordes redondeados.
                              border: Border.all(
                                color: Color(0xFF4CAF50), // Color verde para el borde.
                                width: getSize(1.5), // Ancho del borde.
                              ),
                            ),
                            child: Padding(
                              padding: getPadding(top: getSize(14), bottom: getSize(14)),
                              child: Center(
                                child: Text(
                                  'No', // Texto del botón "No".
                                  style: TextStyle(
                                    color: Color(0xFF4CAF50), // Texto en verde.
                                    fontSize: getFontSize(18), // Tamaño del texto.
                                    fontWeight: FontWeight.w700, // Peso del texto.
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: getSize(20)), // Espacio entre los botones.
                    
                    Expanded(
                      // Botón "Sí", que llama a la función de salida.
                      child: GestureDetector(
                        onTap: () {
                          PrefData.currentIndex = 0; // Resetea el índice a la página principal.
                          Get.back(); // Cierra el cuadro de diálogo.
                          controller.onExit(); // Llama la función de salida en el controlador.
                        },
                        child: Padding(
                          padding: getPadding(bottom: 16, right: 16),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8), // Bordes redondeados.
                              color: Color(0xFF4CAF50), // Fondo verde para el botón.
                            ),
                            child: Padding(
                              padding: getPadding(top: getSize(14), bottom: getSize(14)),
                              child: Center(
                                child: Text(
                                  'Sí', // Texto del botón "Sí".
                                  style: TextStyle(
                                    color: Colors.white, // Texto en blanco.
                                    fontSize: getFontSize(18), // Tamaño del texto.
                                    fontWeight: FontWeight.w700, // Peso del texto.
                                  ),
                                  textAlign: TextAlign.center,
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
            controller.update(); // Actualiza el estado del controlador.
          }
          else {
            PrefData.currentIndex = 0; // Resetea el índice si no estamos en la pantalla principal.
            controller.update();
          }
          return Future(() => false); // Cancela el comportamiento por defecto del botón de retroceso.
        },
        
        child: Scaffold(
          backgroundColor: AppColor.white, // Fondo blanco para la pantalla principal.
          
          floatingActionButton: Padding( // Botón flotante para agregar un nuevo plan.
            padding: getPadding(top: Platform.isIOS ? 5 : 35), // Ajusta el padding según la plataforma.
            child: GestureDetector(
              onTap: () {
                PrefData.currentIndex = 2; // Cambia el índice a la pantalla de agregar plan.
                controller.update();
              },
              child: Container(
                height: getSize(64), // Tamaño del botón flotante.
                width: getSize(64),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xFF5E9920), // Color verde del botón flotante.
                  shape: BoxShape.circle, // Hace que el botón sea circular.
                ),
                child: CustomImageView(
                  svgPath: Assets.imagesImgIcadd, // Ícono de añadir.
                ),
              ),
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked, // Ubicación del botón flotante en la pantalla.
          
          body: SafeArea(
            child: Center(
              child: pageList.elementAt(PrefData.currentIndex), // Muestra la página correspondiente según el índice.
            ),
          ),
          
          bottomNavigationBar: CustomBottomBarDoctor(onChanged: (BottomBarEnum type) {
            Get.toNamed(getCurrentRoute(type), id: 1); // Redirige según la opción seleccionada en la barra inferior.
          })
        ),
      );
    }, init: HomeDoctorContainerController()); // Inicializa el controlador de la pantalla.
  }

  // =============================
  // 🟩 SECCIÓN: Manejo de rutas
  // =============================

  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.homeDoctorPage;
      case BottomBarEnum.ourMenu:
        return AppRoutes.menuPage;
      case BottomBarEnum.add:
        return AppRoutes.chooseYourPlanStandardTabContainerScreen;
      case BottomBarEnum.myPlan:
        return AppRoutes.myPlanPage;
      case BottomBarEnum.Profile:
        return AppRoutes.profilePage;
      default:
        return "/";
    }
  }

  // =============================
  // 🟩 SECCIÓN: Manejo de páginas
  // =============================

  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {

      case AppRoutes.homeDoctorPage:
        return HomeDoctorPage();

      case AppRoutes.listPacientes:
        return ListPacientes();

      case AppRoutes.createRegistro:
        return CreateRegistro();

      case AppRoutes.myPlanPage:
        return MyPlanPage();

      case AppRoutes.listCompanies:
        return ListCompanies();

      default:
        return DefaultWidget();
    }
  }

  // =============================
  // 🟩 SECCIÓN: Lista de páginas
  // =============================

  List<Widget> pageList = [
    HomeDoctorPage(), // Página de inicio.
    ListPacientes(), // Página de menú.
    CreateRegistro(), // Página para elegir plan.
    ListCompanies(), // Página de planes del usuario.
    ProfilePage(), // Página de perfil.
  ];
}
