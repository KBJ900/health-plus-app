import 'package:flutter/material.dart';
import 'package:diet_recipe_app/core/app_export.dart';
import 'package:diet_recipe_app/data/listdata/app_listdata.dart';
import 'package:diet_recipe_app/data/pref_data/pref_data.dart';
import 'package:diet_recipe_app/presentation/home_screen_page/widget/healthy_food_menu_banner.dart';
import 'package:diet_recipe_app/presentation/home_screen_page/widget/home_option.dart';
import 'package:diet_recipe_app/presentation/home_screen_page/widget/running_card.dart';
import 'package:diet_recipe_app/presentation/home_screen_page/widget/what_lunch_container.dart';
import 'package:diet_recipe_app/presentation/recommendations_screen/controller/recommendations_controller.dart';
import '../../../presentation/recommendations_screen/widgets/recommendations_item_widget.dart';
import 'controller/home_screen_controller.dart';
import 'models/home_screen_model.dart';

// ignore_for_file: must_be_immutable
class HomeScreenPage extends StatelessWidget {
  HomeScreenPage({Key? key}) : super(key: key);

  HomeScreenController controller =
      Get.put(HomeScreenController(HomeScreenModel().obs));

  RecommendationsController recommendationsController =
      Get.put(RecommendationsController());

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    // =============================
// 🟦 SECCIÓN: Estructura general
// =============================
    return Scaffold(
        // Contenedor principal que organiza la estructura de la pantalla.
        backgroundColor: theme.colorScheme
            .onPrimaryContainer, // Define el color de fondo de la pantalla.

        // =============================
        // 🟩 SECCIÓN: Contenido principal
        // =============================
        body: Column(// Organiza los widgets hijos verticalmente.
            children: [
          // Lista de widgets hijos dentro de la columna.

          // =============================
          // 🟨 SECCIÓN: Barra superior
          // =============================
          Padding(
            // Agrega espacio alrededor de un widget.
            padding: getPadding(
                left: 20,
                right: 20,
                top: 16,
                bottom:
                    16), // Define los márgenes superior, inferior, izquierdo y derecho.
            child: Row(
              // Organiza los widgets horizontalmente.
              mainAxisAlignment: MainAxisAlignment
                  .spaceBetween, // Deja espacio uniforme entre los hijos del Row.
              crossAxisAlignment: CrossAxisAlignment
                  .center, // Centra los widgets verticalmente dentro del Row.
              children: [
                // Lista de widgets dentro del Row.

                // 🟧 Subsección: Texto de bienvenida
                Expanded(
                  // Hace que este widget ocupe todo el espacio disponible horizontalmente.
                  child: Column(
                    // Organiza widgets verticalmente.
                    crossAxisAlignment: CrossAxisAlignment
                        .start, // Alinea los widgets al inicio horizontalmente.
                    children: [
                      // Lista de widgets dentro del Column.
                      Text(
                        // Muestra texto en pantalla.
                        'Welcome', // Texto que se mostrará.
                        style: TextStyle(
                            // Define el estilo del texto.
                            color: AppColor.black, // Color del texto.
                            fontSize: getFontSize(28), // Tamaño de la fuente.
                            fontWeight: FontWeight
                                .w700), // Peso de la fuente (negrita).
                      ),
                      Text(
                        // Muestra otro texto en pantalla.
                        'john hola', // Texto que se mostrará.
                        style: TextStyle(
                            // Define el estilo del texto.
                            color: AppColor.grey400, // Color del texto.
                            fontSize: getFontSize(16), // Tamaño de la fuente.
                            fontWeight:
                                FontWeight.w400), // Peso de la fuente (normal).
                      ),
                    ],
                  ),
                ),

                // 🟪 Subsección: Ícono de notificación
                GestureDetector(
                  // Detecta interacciones táctiles en este widget.
                  onTap: () {
                    // Función que se ejecuta al tocar este widget.
                    onTapIcnotification(); // Llama a la función para manejar la acción de la notificación.
                  },
                  child: Padding(
                    // Agrega espacio alrededor del hijo (ícono de notificación).
                    padding:
                        getPadding(right: 16), // Margen derecho de 16 píxeles.
                    child: CustomImageView(
                      // Widget personalizado para mostrar una imagen.
                      svgPath: ImageConstant
                          .imgIcnotification, // Ruta de la imagen SVG.
                    ),
                  ),
                ),

                // 🟥 Subsección: Ícono de premium
                GestureDetector(
                  // Detecta toques en este widget.
                  onTap: () {
                    // Función que se ejecuta al tocar este widget.
                    Get.toNamed(AppRoutes
                        .premiumScreen); // Navega a la pantalla de "premium".
                  },
                  child: CustomImageView(
                    // Widget personalizado para mostrar otra imagen.
                    svgPath: ImageConstant
                        .imgPremiumquality3, // Ruta de la imagen SVG.
                  ),
                ),
              ],
            ),
          ),

          // =============================
          // 🟦 SECCIÓN: Lista desplazable
          // =============================
          Expanded(
            // Hace que este widget (ListView) ocupe todo el espacio restante verticalmente.
            child: ListView(
              // Lista desplazable verticalmente.
              physics:
                  BouncingScrollPhysics(), // Agrega un efecto de rebote al desplazarse.
              children: [
                // Lista de widgets hijos dentro del ListView.

                // 🟩 Subsección: Tarjeta de running
                RunningCard(), // Widget personalizado, posiblemente una tarjeta con información.

                // 🟨 Subsección: Opción de inicio
                HomeOption(), // Otro widget personalizado con una opción.

                // 🟧 Subsección: ¿Qué hay para el almuerzo?
                Padding(
                    // Agrega espacio alrededor del siguiente Row.
                    padding: getPadding(
                        left: 20,
                        right: 20), // Define márgenes izquierdo y derecho.
                    child: Row(
                        // Organiza widgets horizontalmente.
                        mainAxisAlignment: MainAxisAlignment
                            .spaceBetween, // Deja espacio uniforme entre los widgets.
                        children: [
                          // Lista de widgets dentro del Row.
                          Text(
                              // Texto que se muestra a la izquierda.
                              "lbl_what_for_lunch"
                                  .tr, // Texto traducido (internacionalización).
                              style: theme.textTheme
                                  .titleLarge), // Estilo tomado del tema.
                          GestureDetector(
                              // Detecta toques en el siguiente texto.
                              onTap: () {
                                // Función que se ejecuta al tocar el texto.
                                onTapTxtViewall(); // Llama a la función para manejar la acción.
                              },
                              child: Padding(
                                  // Agrega espacio alrededor del texto interactivo.
                                  padding: getPadding(
                                      top: 3,
                                      bottom: 3), // Margen superior e inferior.
                                  child: Text(
                                      // Texto que se muestra a la derecha.
                                      "lbl_view_all"
                                          .tr, // Texto traducido (internacionalización).
                                      style: CustomTextStyles
                                          .bodyLargeOnError_1))) // Estilo personalizado.
                        ])),

                // 🟥 Subsección: Banner de menú saludable
                GestureDetector(
                    // Detecta toques en el banner interactivo.
                    onTap: () {
                      // Función que se ejecuta al tocar.
                      PrefData.currentIndex = 1; // Actualiza el índice actual.
                      controller
                          .update(); // Actualiza el estado del controlador.
                    },
                    child:
                        HealthyFoodMenuBanner()), // Muestra un banner personalizado.
              ],
            ),
          )
        ]));
  }

  onTapIcnotification() {
    Get.toNamed(
      AppRoutes.notificationsScreen,
    );
  }

  onTapColumncalendar() {
    Get.toNamed(
      AppRoutes.moveDaysScreen,
    );
  }

  onTapColumnplusone() {
    Get.toNamed(
      AppRoutes.addMenuTabContainerScreen,
    );
  }

  onTapColumnsignal() {
    Get.toNamed(
      AppRoutes.changeDeliveryAddressScreen,
    );
  }

  onTapTxtViewall() {
    Get.toNamed(
      AppRoutes.whatForLunchScreen,
    );
  }

  onTapTxtViewallone() {
    Get.toNamed(
      AppRoutes.recommendationsScreen,
    );
  }
}
