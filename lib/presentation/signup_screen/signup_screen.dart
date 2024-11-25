import 'package:flutter/material.dart';
import 'package:diet_recipe_app/core/app_export.dart';
import 'package:diet_recipe_app/core/utils/validation_functions.dart';
import 'package:diet_recipe_app/widgets/custom_elevated_button.dart';
import 'package:diet_recipe_app/widgets/custom_text_form_field.dart';

import 'controller/signup_controller.dart';
import '../../services/register_service.dart';

// =============================
// 🟪 SECCIÓN: Importación de librerías y configuración inicial
// =============================
class SignupScreen extends GetWidget<SignupController> {
  SignupScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey =
      GlobalKey<FormState>(); // Clave para el formulario para validaciones.

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context); // Obtiene los datos de la pantalla.

    // =============================
    // 🟩 SECCIÓN: Scaffold y configuración de la pantalla
    // =============================
    return Scaffold(
      resizeToAvoidBottomInset: false, // Evita que la pantalla se mueva.
      backgroundColor: theme.colorScheme.onPrimaryContainer, // Color de fondo.
      body: Form(
        key: _formKey, // Asociamos la clave global del formulario.
        child: Container(
          child: Column(
            children: [
              // =============================
              // 🟩 SECCIÓN: Imagen y Título
              // =============================
              CustomImageView(
                imagePath: ImageConstant.imgTopView, // Ruta de la imagen.
              ),
              Center(
               child: Padding(
                        padding: getPadding(top: 150),
                child: Text(
                  "lbl_signup2".tr,
                  style: theme.textTheme.displayMedium, // Título principal.
                ),
                ),
              ),
              Center(
                child: Padding(
                        padding: getPadding(top: 20),
                  child: Text(
                    "msg_join_us_on_an_exciting".tr,
                    style: theme.textTheme.bodyLarge, // Mensaje de bienvenida.
                  ),
                ),
              ),
              // =============================
              // 🟩 SECCIÓN: Formulario de Entrada
              // =============================
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero, // Elimina padding predeterminado.
                  children: [
                    Column(
                      children: [
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
                            textInputType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null ||
                                  (!isValidEmail(value, isRequired: true))) {
                                return "Please enter valid email";
                              }
                              return null;
                            },
                          ),
                        ),
                        // =============================
                        // 🟩 SECCIÓN: Campo de Contraseña
                        // =============================
                        Obx(
                          () => CustomTextFormField(
                            textStyle: theme.textTheme.bodyLarge,
                            autofocus: false,
                            controller: controller.passwordController,
                            margin: getMargin(top: 40),
                            hintText: "Password".tr,
                            hintStyle: CustomTextStyles.bodyLargeOnError_1,
                            textInputType: TextInputType.visiblePassword,
                            suffix: InkWell(
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
                                      : ImageConstant.imgEye,
                                ),
                              ),
                            ),
                            suffixConstraints: BoxConstraints(
                                maxHeight: getVerticalSize(57)),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter valid password";
                              }
                              return null;
                            },
                            obscureText: controller.isShowPassword.value,
                            contentPadding: getPadding(top: 18, bottom: 18),
                          ),
                        ),
                        // =============================
                        // 🟩 SECCIÓN: Botón de Registro
                        // =============================
CustomElevatedButton(
  text: "lbl_signup2".tr,
  margin: getMargin(left: 20, top: 48, right: 20),
  onTap: () async {
    if (_formKey.currentState!.validate()) {
      // Obtiene los valores de los campos de correo y contraseña
      String email = controller.emailController.text;
      String password = controller.passwordController.text;

      try {
        // Llama al servicio de registro
        Map<String, dynamic> response = await RegisterService().register(email, password);

        // Aquí puedes hacer algo con la respuesta (por ejemplo, mostrar un mensaje o navegar a otra pantalla)
        print("Registro exitoso: $response"); // Ejemplo de salida de la respuesta

        // Limpiar los campos después del registro
        controller.emailController.clear();
        controller.passwordController.clear();

        // Navegar a otra pantalla si el registro fue exitoso
        // Ejemplo: Navegar a la pantalla principal si el registro fue exitoso
        Get.toNamed(AppRoutes.homeScreenContainerScreen); // Ejemplo de navegación exitosa

      } catch (e) {
        // Manejo de errores: si ocurre un error, muestra un mensaje adecuado al usuario
        print("Error: $e");
        // Puedes usar un SnackBar o un AlertDialog para mostrar el error
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text('Error'),
            content: Text('Hubo un error en el registro. Intenta de nuevo.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          ),
        );
      }
    }
  },
),


                      ],
                    ),
                  ],
                ),
              ),
              // =============================
              // 🟩 SECCIÓN: Enlace para Iniciar Sesión
              // =============================
              GestureDetector(
                onTap: () {
                  onTapTxtAlreadyhavean();
                },
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: getPadding(bottom: 220, left: 92),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "msg_already_have_an2".tr,
                            style: CustomTextStyles.bodyLargeOnError,
                          ),
                          TextSpan(
                            text: "lbl_login".tr,
                            style: CustomTextStyles.titleMediumPrimary_1,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.left,
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
    Get.toNamed(AppRoutes.homeScreenContainerScreen);
  }

  onTapTxtAlreadyhavean() {
    Get.toNamed(AppRoutes.loginScreen);
  }
}
