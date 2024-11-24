import 'package:flutter/material.dart';
import 'package:diet_recipe_app/core/app_export.dart';
import 'package:diet_recipe_app/core/utils/validation_functions.dart';
import 'package:diet_recipe_app/widgets/custom_elevated_button.dart';
import 'package:diet_recipe_app/widgets/custom_text_form_field.dart';

import 'controller/signup_controller.dart';

// =============================
// 🟪 SECCIÓN: Importación de librerías y configuración inicial
// =============================
class SignupScreen extends GetWidget<SignupController> {
  SignupScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey =
      GlobalKey<FormState>(); // Clave para el formulario para validaciones.

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(
        context); // Obtiene los datos de la pantalla (tamaño, orientación).

    // =============================
// 🟩 SECCIÓN: Scaffold y configuración de la pantalla
// =============================
    return Scaffold(
      resizeToAvoidBottomInset:
          false, // Evita que la pantalla se mueva cuando el teclado aparece.
      backgroundColor: theme.colorScheme
          .onPrimaryContainer, // Establece el color de fondo de la pantalla.
      body: Form(
        // Widget Form para manejo de validación.
        key: _formKey, // Asociamos la clave global del formulario.
        child: Container(
          // Contenedor principal para widgets.
          child: Column(
            // Organiza los widgets en una columna.
            children: [
              // =============================
// 🟩 SECCIÓN: Imagen y Título
// =============================
              CustomImageView(
                // Muestra una imagen en la parte superior.
                imagePath: ImageConstant.imgTopView, // Ruta de la imagen.
              ),
              Center(
                // Centra el título en la pantalla.
                child: Text("lbl_signup2".tr,
                    style: theme.textTheme
                        .displayMedium), // Título principal de la pantalla.
              ),
              Center(
                child: Padding(
                  // Padding alrededor del texto.
                  padding: getPadding(top: 16), // Padding superior.
                  child: Text("msg_join_us_on_an_exciting".tr,
                      style:
                          theme.textTheme.bodyLarge), // Mensaje de bienvenida.
                ),
              ),

              // =============================
// 🟩 SECCIÓN: Formulario de Entrada
// =============================
              Expanded(
                // Expande el espacio disponible para los siguientes elementos.
                child: ListView(
                    // Lista para los campos del formulario.
                    padding:
                        EdgeInsets.zero, // Elimina el padding predeterminado.
                    children: [
                      Column(
                        children: [
                          // =============================
// 🟩 SECCIÓN: Campo de Primer Nombre
// =============================
                          Padding(
                            padding: getPadding(top: 32, bottom: 24),
                            child: CustomTextFormField(
                                // Campo para el primer nombre.
                                controller: controller.firstNameController,
                                hintText:
                                    "lbl_first_name".tr, // Texto sugerido.
                                hintStyle: CustomTextStyles
                                    .bodyLargeOnError_1, // Estilo del texto sugerido.
                                validator: (value) {
                                  // Función de validación.
                                  if (value == null || value.isEmpty) {
                                    return "Please enter valid name"; // Mensaje de error.
                                  }
                                  return null;
                                }),
                          ),

                          // =============================
// 🟩 SECCIÓN: Campo de Apellido
// =============================
                          CustomTextFormField(
                              controller: controller.lastNameController,
                              margin: getMargin(left: 20, top: 24, right: 20),
                              hintText: "lbl_last_name".tr,
                              hintStyle: CustomTextStyles.bodyLargeOnError_1,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter valid surname"; // Mensaje de error.
                                }
                                return null;
                              }),

                          // =============================
// 🟩 SECCIÓN: Campo de Correo Electrónico
// =============================
                          Padding(
                            padding: getPadding(top: 24, bottom: 24),
                            child: CustomTextFormField(
                              controller: controller.emailController,
                              margin: getMargin(left: 20, top: 24, right: 20),
                              hintText: "lbl_email_address".tr,
                              hintStyle: CustomTextStyles.bodyLargeOnError_1,
                              textInputType: TextInputType
                                  .emailAddress, // Campo de tipo correo electrónico.
                              validator: (value) {
                                if (value == null ||
                                    (!isValidEmail(value, isRequired: true))) {
                                  return "Please enter valid email"; // Mensaje de error si no es un correo válido.
                                }
                                return null;
                              },
                            ),
                          ),

                          // =============================
// 🟩 SECCIÓN: Campo de Contraseña
// =============================
                          Obx(() => CustomTextFormField(
                              // Campo de contraseña con control de visibilidad.
                              textStyle: theme.textTheme.bodyLarge,
                              autofocus: false,
                              controller: controller.passwordController,
                              margin: getMargin(top: 40),
                              hintText: "Password".tr,
                              hintStyle: CustomTextStyles.bodyLargeOnError_1,
                              textInputType: TextInputType
                                  .visiblePassword, // Campo para contraseña visible.
                              suffix: InkWell(
                                // Permite mostrar u ocultar la contraseña.
                                onTap: () {
                                  controller.isShowPassword.value =
                                      !controller.isShowPassword.value;
                                },
                                child: Container(
                                  margin: getMargin(
                                      left: 30, top: 16, right: 16, bottom: 16),
                                  child: CustomImageView(
                                      svgPath: controller.isShowPassword.value
                                          ? ImageConstant.imgEye
                                          : ImageConstant
                                              .imgEye), // Cambia el icono según la visibilidad.
                                ),
                              ),
                              suffixConstraints: BoxConstraints(
                                  maxHeight: getVerticalSize(
                                      57)), // Tamaño máximo del sufijo.
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter valid password"; // Mensaje de error si la contraseña es inválida.
                                }
                                return null;
                              },
                              obscureText: controller.isShowPassword
                                  .value, // Controla si la contraseña está oculta o visible.
                              contentPadding: getPadding(
                                  top: 18,
                                  bottom: 18) // Padding dentro del campo.
                              )),

                          // =============================
// 🟩 SECCIÓN: Botón de Registro
// =============================
                          CustomElevatedButton(
                              text: "lbl_signup2".tr,
                              margin: getMargin(left: 20, top: 48, right: 20),
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  controller.firstNameController.clear();
                                  controller.lastNameController.clear();
                                  controller.emailController.clear();
                                  controller.passwordController.clear();
                                  onTapTxtAlreadyhavean();
                                } else {}
                              }),
                        ],
                      ),
                    ]),
              ),

              // =============================
// 🟩 SECCIÓN: Enlace para Iniciar Sesión
// =============================
              GestureDetector(
                onTap: () {
                  onTapTxtAlreadyhavean();
                },
                child: Align(
                  alignment: Alignment
                      .bottomCenter, // Alinea el enlace en la parte inferior central.
                  child: Padding(
                    padding: getPadding(bottom: 220, left: 92),
                    child: RichText(
                        // Texto enriquecido con enlaces.
                        text: TextSpan(children: [
                          TextSpan(
                              text: "msg_already_have_an2".tr,
                              style: CustomTextStyles
                                  .bodyLargeOnError // Estilo para el texto.
                              ),
                          TextSpan(
                              text: "lbl_login".tr,
                              style: CustomTextStyles
                                  .titleMediumPrimary_1 // Estilo para el enlace.
                              )
                        ]),
                        textAlign:
                            TextAlign.left // Alinea el texto a la izquierda.
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

  // =============================
// 🟩 SECCIÓN: Funciones de Navegación
// =============================
  onTapSignup() {
    Get.toNamed(
      AppRoutes.homeScreenContainerScreen, // Navega a la pantalla principal.
    );
  }

  onTapTxtAlreadyhavean() {
    Get.toNamed(
      AppRoutes.loginScreen, // Navega a la pantalla de inicio de sesión.
    );
  }
}
