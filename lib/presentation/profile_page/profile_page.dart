import 'package:diet_recipe_app/presentation/profile_page/widget/profile_ope.dart';
import '../../data/pref_data/pref_data.dart';
import 'controller/profile_controller.dart';
import 'models/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:diet_recipe_app/core/app_export.dart';

// =============================
// 🟩 SECCIÓN: Clase de la Página de Perfil
// =============================
class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  ProfileController controller = Get.put(ProfileController(ProfileModel().obs));

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context); // Obtiene la información de la pantalla.

    return Scaffold(
      backgroundColor: theme.colorScheme.onPrimaryContainer, // Establece el color de fondo.
      body: SafeArea( // Evita que el contenido quede cubierto por las barras de estado.
        child: Column( // Se organiza el contenido de la página en una columna.
          crossAxisAlignment: CrossAxisAlignment.start, // Alinea los elementos a la izquierda.
          mainAxisAlignment: MainAxisAlignment.start, // Alinea los elementos desde la parte superior.
          children: [
            
            // ============================= 
            // 🟩 SECCIÓN: Título de la Página 
            // =============================
            Padding(
              padding: getPadding(top: 29, left: 20), // Añade relleno en la parte superior y a la izquierda.
              child: Text(
                "lbl_profile".tr, // Traducción del texto 'perfil' usando GetX.
                style: theme.textTheme.headlineMedium, // Estilo del texto del título.
              ),
            ),

            // ============================= 
            // 🟩 SECCIÓN: Foto de Perfil y Datos Personales 
            // =============================
            Padding(
              padding: getPadding(
                top: 40, right: 20, left: 20, bottom: 32), // Relleno alrededor de la foto.
              child: Row( // Organiza los widgets de la foto y la información personal en una fila.
                children: [
                  CustomImageView(
                    svgPath: ImageConstant.imgAvtar1, // Ruta de la imagen del avatar.
                    height: getSize(100), // Establece la altura de la imagen.
                    width: getSize(100), // Establece el ancho de la imagen.
                  ),
                  Padding(
                    padding: getPadding(
                      left: 15,
                      top: 23,
                      bottom: 23, // Relleno para los datos personales.
                    ),
                    child: Column( // Organiza el nombre y correo en una columna.
                      crossAxisAlignment: CrossAxisAlignment.start, // Alinea el texto a la izquierda.
                      mainAxisAlignment: MainAxisAlignment.start, // Alinea desde la parte superior.
                      children: [
                        Text(
                          "lbl_john_abram2".tr, // Nombre traducido.
                          style: theme.textTheme.titleMedium, // Estilo del nombre.
                        ),
                        Padding(
                          padding: getPadding(
                            top: 11, // Relleno para el correo electrónico.
                          ),
                          child: Text(
                            "msg_johnabram_gmail_com".tr, // Correo traducido.
                            style: theme.textTheme.bodyLarge, // Estilo para el correo.
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            
            // ============================= 
            // 🟩 SECCIÓN: Opciones de Perfil (Botones) 
            // =============================
            ProfileOpe(
              onTapOption: () {
                Get.toNamed(AppRoutes.myProfileScreen); // Navega a la pantalla de perfil.
              },
            ),
            ProfileOpe(
              onTapOption: () {
                Get.toNamed(AppRoutes.settingsScreen); // Navega a la pantalla de configuraciones.
              },
              optionName: 'Configuración', // Nombre de la opción traducido.
              optionImg: ImageConstant.imgSettings, // Imagen para la opción de configuración.
            ),
            ProfileOpe(
              onTapOption: () {
                Get.toNamed(AppRoutes.privacyPolicyScreen); // Navega a la pantalla de la política de privacidad.
              },
              optionName: 'Política de privacidad', // Nombre de la opción traducido.
              optionImg: ImageConstant.imgCheckmark, // Imagen para la opción de política de privacidad.
            ),
          

            // ============================= 
            // 🟩 SECCIÓN: Cierre de Sesión (Botón) 
            // =============================
            ProfileOpe(
              onTapOption: () {
                showDialog<String>( // Muestra un cuadro de diálogo para confirmar el cierre de sesión.
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    backgroundColor: Colors.white, // Color de fondo del cuadro de diálogo.
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(getHorizontalSize(16)))), // Bordes redondeados.
                    insetPadding: getPadding(left: 16, right: 16), // Relleno dentro del cuadro de diálogo.
                    title: Padding(
                      padding: getPadding(left: 15, right: 15),
                      child: Text(
                        '¿Está segur@ de que desea cerrar sesión?', // Pregunta de confirmación traducida.
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: getFontSize(22),
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    actions: <Widget>[ // Botones de acción dentro del cuadro de diálogo.
                      Padding(
                        padding: getPadding(bottom: 20),
                        child: Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Get.back(); // Cierra el cuadro de diálogo si el usuario toca 'No'.
                                },
                                child: Padding(
                                  padding: getPadding(left: getSize(15)),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: Colors.green, // Color verde del borde del botón 'No'.
                                        width: getSize(1.5),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: getPadding(top: getSize(14), bottom: getSize(14)),
                                      child: Center(
                                        child: Text(
                                          'No', // Texto del botón 'No' traducido.
                                          style: TextStyle(
                                            color: Colors.green, // Texto verde en el botón 'No'.
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
                            SizedBox(width: getSize(20)), // Espacio entre los botones.
                            Expanded(
                              child: GestureDetector(
                                onTap: ()  {
                                  PrefData.currentIndex = 0; // Restablece el índice.
                                  PrefData.setLogin(true); // Marca al usuario como logueado.
                                  Get.toNamed(AppRoutes.loginScreen); // Navega a la pantalla de login.
                                },
                                child: Padding(
                                  padding: getPadding(right: getSize(15)),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.green, // Color verde del botón 'Sí'.
                                    ),
                                    child: Padding(
                                      padding: getPadding(top: getSize(14), bottom: getSize(14)),
                                      child: Center(
                                        child: Text(
                                          'Sí', // Texto del botón 'Sí' traducido.
                                          style: TextStyle(
                                            color: Colors.white, // Texto blanco en el botón 'Sí'.
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
                      ),
                    ],

                  ),
                );
                controller.update(); // Actualiza el controlador.
              },
              optionName: 'Cerrar sesión', // Nombre de la opción 'Cerrar sesión' traducido.
              optionImg: ImageConstant.imgReply, // Imagen asociada al cierre de sesión.
            ),
          ],
        ),
      ),
    );
  }
}
