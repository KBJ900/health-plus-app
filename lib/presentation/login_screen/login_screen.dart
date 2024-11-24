// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:diet_recipe_app/core/app_export.dart';
import 'package:diet_recipe_app/core/utils/validation_functions.dart';
import 'package:diet_recipe_app/widgets/custom_elevated_button.dart';
import 'package:diet_recipe_app/widgets/custom_text_form_field.dart';
import '../../data/pref_data/pref_data.dart';
import 'controller/login_controller.dart';

// ignore_for_file: must_be_immutable
// Define la clase LoginScreen, que es un widget basado en GetWidget (de GetX).
class LoginScreen extends GetWidget<LoginController> {
  LoginScreen({Key? key}) : super(key: key);

  // Define una clave global para el formulario de login, necesaria para validaciones.
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

// =============================
// 🟦 SECCIÓN: Estructura general
// =============================
  @override
  Widget build(BuildContext context) {
    // Obtiene los datos de la pantalla del dispositivo para manejar la visualización.
    mediaQueryData = MediaQuery.of(context);

    return WillPopScope(
      // Captura el evento de retroceso del dispositivo (botón de retroceso).
      onWillPop: () {
        // Muestra un cuadro de diálogo de confirmación para salir.
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            backgroundColor:
                Colors.white, // Fondo blanco para el cuadro de diálogo.
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(
                  16)), // Bordes redondeados del cuadro de diálogo.
            ),
            insetPadding: getPadding(
                left: 30, right: 30), // Margen interno del cuadro de diálogo.

            // =============================
// 🟩 SECCIÓN: Título del cuadro de diálogo
// =============================
            title: Padding(
              padding: getPadding(left: getSize(50), right: getSize(50)),
              child: Text(
                'Are you sure you want to Exit?', // Texto que indica si está seguro de salir.
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
                            borderRadius:
                                BorderRadius.circular(8), // Bordes redondeados.
                            border: Border.all(
                              color: theme.focusColor, // Color del borde.
                              width: getSize(1.5), // Ancho del borde.
                            ),
                          ),
                          child: Padding(
                            padding: getPadding(
                                top: getSize(14), bottom: getSize(14)),
                            child: Center(
                              child: Text(
                                'No', // Texto del botón "No".
                                style: TextStyle(
                                  color: const Color.fromARGB(
                                      255, 0, 0, 0), // Texto en blanco.
                                  fontSize:
                                      getFontSize(18), // Tamaño del texto.
                                  fontWeight:
                                      FontWeight.w700, // Peso del texto.
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
                    // Botón "Yes", que llama a la función de salida.
                    child: GestureDetector(
                      onTap: () {
                        controller
                            .onExit(); // Llama a la función onExit en el controlador.
                        controller
                            .update(); // Actualiza el estado del controlador.
                      },
                      child: Padding(
                        padding: getPadding(bottom: 16, right: 16),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(8), // Bordes redondeados.
                            color: theme.focusColor, // Color del borde.
                            // Fondo color primario del botón.
                          ),
                          child: Padding(
                            padding: getPadding(
                                top: getSize(14), bottom: getSize(14)),
                            child: Center(
                              child: Text(
                                'Yes', // Texto del botón "Yes".
                                style: TextStyle(
                                  color: Colors.white, // Texto en blanco.
                                  fontSize:
                                      getFontSize(18), // Tamaño del texto.
                                  fontWeight:
                                      FontWeight.w700, // Peso del texto.
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
        return Future(() =>
            false); // Cancela el comportamiento predeterminado del botón de retroceso.
      },

// =============================
// 🟨 SECCIÓN: Pantalla principal
// =============================
      child: Scaffold(
        resizeToAvoidBottomInset:
            false, // No ajusta el contenido cuando el teclado aparece.
        backgroundColor: theme.colorScheme
            .onPrimaryContainer, // Establece el color de fondo del Scaffold.

        // =============================
// 🟪 SECCIÓN: Formulario de login
// =============================
        body: Form(
          key: _formKey, // Clave del formulario para validaciones.
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.start, // Alinea los elementos en el inicio.
            children: [
              // Imagen en la parte superior.
              CustomImageView(
                imagePath: ImageConstant.imgTopView,
              ),

              Expanded(
                // Hace que el contenido sea desplazable.
                child: ListView(
                  padding:
                      EdgeInsets.zero, // Elimina los márgenes predeterminados.
                  physics:
                      BouncingScrollPhysics(), // Efecto de rebote cuando se desplaza.
                  shrinkWrap:
                      true, // Ajusta el tamaño del ListView al contenido.
                  children: [
                    // =============================
// 🟩 SECCIÓN: Título "Login"
// =============================
                    Center(
                      child: Padding(
                        padding: getPadding(top: 150),
                        child: Text(
                          "lbl_login".tr, // Texto de login que se traduce.
                          style: theme.textTheme
                              .displayMedium, // Usa el estilo de texto del tema.
                        ),
                      ),
                    ),
                    // =============================
// 🟦 SECCIÓN: Subtítulo "Welcome back"
// =============================
                    Center(
                      child: Padding(
                        padding: getPadding(top: 25),
                        child: Text(
                          "msg_hello_welcome_back"
                              .tr, // Mensaje de bienvenida traducido.
                          style: theme.textTheme
                              .bodyLarge, // Usa el estilo de texto del tema.
                        ),
                      ),
                    ),
                    // =============================
// 🟩 SECCIÓN: Campo de correo
// =============================
                    Padding(
                      padding: getPadding(top: 48, bottom: 24),
                      child: CustomTextFormField(
                        textStyle: TextStyle(
                          color: Colors.black, // Texto en negro.
                          fontSize: getFontSize(16), // Tamaño del texto.
                          fontWeight: FontWeight.w400, // Peso del texto.
                        ),
                        textInputAction: TextInputAction
                            .next, // Acción de siguiente al ingresar el correo.
                        autofocus: false, // Sin enfoque automático.
                        controller: controller
                            .emailController, // Controlador para el campo de correo.
                        margin: getMargin(left: 20, top: 49, right: 20),
                        hintText: "lbl_email_address"
                            .tr, // Texto placeholder (correo).
                        hintStyle: CustomTextStyles
                            .bodyLargeOnError_1, // Estilo del placeholder.
                        textInputType: TextInputType
                            .emailAddress, // Tipo de entrada (correo electrónico).
                        validator: (value) {
                          if (value == null ||
                              (!isValidEmail(value, isRequired: true))) {
                            return "Por favor ingrese un correo electrónico válido"; // Mensaje de error si no es un correo válido.
                          }
                          return null;
                        },
                      ),
                    ),
                    // =============================
// 🟧 SECCIÓN: Campo de contraseña
// =============================
                    Obx(() => CustomTextFormField(
                          textStyle: theme.textTheme.bodyLarge,
                          autofocus: false,
                          controller: controller
                              .passwordController, // Controlador para la contraseña.
                          margin: getMargin(top: 40),
                          hintText:
                              "Password".tr, // Texto placeholder (contraseña).
                          textInputAction: TextInputAction
                              .done, // Acción de done al ingresar la contraseña.
                          hintStyle: CustomTextStyles
                              .bodyLargeOnError_1, // Estilo del placeholder.
                          textInputType: TextInputType
                              .visiblePassword, // Tipo de entrada (contraseña visible).
                          suffix: InkWell(
                            onTap: () {
                              controller.isShowPassword.value = !controller
                                  .isShowPassword
                                  .value; // Muestra/oculta la contraseña.
                            },
                            child: Container(
                              margin: getMargin(
                                  left: 30, top: 16, right: 16, bottom: 16),
                              child: CustomImageView(
                                svgPath: controller.isShowPassword.value
                                    ? ImageConstant.imgEye
                                    : ImageConstant
                                        .imgEye, // Icono de ojo para mostrar/ocultar.
                              ),
                            ),
                          ),
                          obscureText: controller.isShowPassword
                              .value, // Si la contraseña está oculta.
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Por favor ingrese una contraseña válida"; // Mensaje de error si la contraseña está vacía.
                            }
                            return null;
                          },
                        )),
// =============================
// 🟪 SECCIÓN: Botón de login
// =============================
                    CustomElevatedButton(
                      text: "lbl_login".tr, // Texto del botón.
                      margin: getMargin(left: 20, top: 49, right: 20),
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          PrefData.setLogin(
                              false); // Desmarca el estado de login.
                          onTapLogin(); // Llama a la función de login.
                          controller.emailController
                              .clear(); // Limpia el campo de correo.
                          controller.passwordController
                              .clear(); // Limpia el campo de contraseña.
                        }
                      },
                    ),
                  ],
                ),
              ),
// =============================
// 🟩 SECCIÓN: Opción para registrarse
// =============================
              GestureDetector(
                onTap: () {
                  onTapTxtDonthaveanaccount(); // Llama a la función para ir a la pantalla de registro.
                },
                child: Padding(
                  padding: getPadding(bottom: 220, left: 92),
                  child: Align(
                    alignment: Alignment
                        .center, // Centra el texto dentro del contenedor
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "msg_don_t_have_an_account2"
                                .tr, // Texto para quienes no tienen cuenta.
                            style: CustomTextStyles.bodyLargeOnError,
                          ),
                          TextSpan(
                            text: "lbl_sign_up"
                                .tr, // Texto "Sign up" para el registro.
                            style: CustomTextStyles.titleMediumPrimary_1,
                          ),
                        ],
                      ),
                      textAlign: TextAlign
                          .center, // Centra el texto dentro del RichText
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // Función de navegación a la pantalla de olvido de contraseña.
  onTapTxtForgotpassword() {
    Get.toNamed(AppRoutes.forgotPasswordScreen);
  }

  // Función de navegación a la pantalla principal después del login.
  onTapLogin() {
    Get.toNamed(AppRoutes.homeScreenContainerScreen);
  }

  // Función de navegación a la pantalla de registro.
  onTapTxtDonthaveanaccount() {
    Get.toNamed(AppRoutes.signupScreen);
  }
}
