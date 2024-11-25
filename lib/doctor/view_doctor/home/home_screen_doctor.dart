// =============================
// 🟨 SECCIÓN: Importaciones
// =============================

import 'dart:io'; // Usado para detectar la plataforma, en este caso iOS y Android.

import 'package:flutter/material.dart'; // Paquete de Flutter para crear la UI.
import 'package:diet_recipe_app/core/app_export.dart'; // Importación de configuraciones y temas globales.
import 'package:diet_recipe_app/presentation/home_screen_page/home_screen_page.dart'; // Pantalla principal.
import 'package:diet_recipe_app/presentation/menu_page/menu_page.dart'; // Pantalla de menú.
import 'package:diet_recipe_app/presentation/menu_tab_container_page/menu_tab_container_page.dart'; // Contenedor de pestañas del menú.
import 'package:diet_recipe_app/presentation/my_plan_page/my_plan_page.dart'; // Pantalla de planes del usuario.
import 'package:diet_recipe_app/presentation/profile_page/profile_page.dart'; // Perfil del usuario.
import 'package:diet_recipe_app/widgets/custom_bottom_app_bar.dart'; // Barra inferior personalizada.
import '../../../data/pref_data/pref_data.dart'; // Datos de preferencias del usuario.
import '../../../generated/assets.dart'; // Recursos generados, como imágenes y activos.
import '../../../presentation/choose_your_plan_standard_tab_container_screen/choose_your_plan_standard_tab_container_screen.dart'; // Pantalla para elegir el plan.
import '../../../presentation/home_screen_container_screen/controller/home_screen_container_controller.dart'; // Controlador de la pantalla principal.


// =============================
// 🟩 SECCIÓN: Definición de clase principal
// =============================

class HomeScreenDoctor extends GetWidget<HomeScreenContainerController> {
  HomeScreenDoctor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context); // Obtiene datos del tamaño de la pantalla.
    
    return GetBuilder<HomeScreenContainerController>(builder: (controller) {
     return WillPopScope(
  onWillPop: () {
    if (PrefData.currentIndex == 0) {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(getHorizontalSize(16)))),
          insetPadding: getPadding(left: 16, right: 16),
          title: Padding(
            padding: getPadding(left: getSize(50), right: getSize(50)),
            child: Text(
              '¿Estás segur@ de que quieres salir?',
              style: TextStyle(
                color: Colors.black,
                fontSize: getFontSize(18),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          actions: <Widget>[
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Padding(
                      padding: getPadding(bottom: 16, left: 16),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Color(0xFF4CAF50),
                            width: getSize(1.5),
                          ),
                        ),
                        child: Padding(
                          padding: getPadding(top: getSize(14), bottom: getSize(14)),
                          child: Center(
                            child: Text(
                              'No',
                              style: TextStyle(
                                color: Color(0xFF4CAF50),
                                fontSize: getFontSize(18),
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: getSize(20)),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      PrefData.currentIndex = 0;
                      Get.back();
                      controller.onExit();
                    },
                    child: Padding(
                      padding: getPadding(bottom: 16, right: 16),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color(0xFF4CAF50),
                        ),
                        child: Padding(
                          padding: getPadding(top: getSize(14), bottom: getSize(14)),
                          child: Center(
                            child: Text(
                              'Sí',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: getFontSize(18),
                                fontWeight: FontWeight.w700,
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
      controller.update();
    } else {
      PrefData.currentIndex = 0;
      controller.update();
    }
    return Future(() => false);
  },
  child: Scaffold(
    backgroundColor: AppColor.white,
    floatingActionButton: Padding(
      padding: getPadding(top: Platform.isIOS ? 5 : 35),
      child: GestureDetector(
        onTap: () {
          PrefData.currentIndex = 2;
          controller.update();
        },
        child: Container(
          height: getSize(64),
          width: getSize(64),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color(0xFF5E9920),
            shape: BoxShape.circle,
          ),
          child: CustomImageView(
            svgPath: Assets.imagesImgIcadd,
          ),
        ),
      ),
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    body: SafeArea(
      child: Center(
        child: pageList.elementAt(PrefData.currentIndex),
      ),
    ),
    bottomNavigationBar: CustomBottomBar(onChanged: (BottomBarEnum type) {
      Get.toNamed(getCurrentRoute(type), id: 1);
    }),
  ),
);
    }, init: HomeScreenContainerController()); // Inicializa el controlador de la pantalla.
  }

  // ============================= 
  // 🟩 SECCIÓN: Manejo de rutas
  // =============================

  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.homeScreenPage;
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
      case AppRoutes.homeScreenPage:
        return HomeScreenPage();
      case AppRoutes.menuTabContainerPage:
        return MenuTabContainerPage();
      case AppRoutes.chooseYourPlanStandardTabContainerScreen:
        return ChooseYourPlanStandardTabContainerScreen();
      case AppRoutes.myPlanPage:
        return MyPlanPage();
      case AppRoutes.profilePage:
        return ProfilePage();
      default:
        return DefaultWidget();
    }
  }

  // ============================= 
  // 🟩 SECCIÓN: Lista de páginas
  // =============================

  List<Widget> pageList = [
    HomeScreenPage(), // Página de inicio.
    MenuPage(), // Página de menú.
    ChooseYourPlanStandardTabContainerScreen(), // Página para elegir plan.
    MyPlanPage(), // Página de planes del usuario.
    ProfilePage(), // Página de perfil.
  ];
}
