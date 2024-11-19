import 'package:diet_recipe_app/core/app_export.dart';import 'package:diet_recipe_app/presentation/forgot_password_screen/models/forgot_password_model.dart';import 'package:flutter/material.dart';/// A controller class for the ForgotPasswordScreen.
///
/// This class manages the state of the ForgotPasswordScreen, including the
/// current forgotPasswordModelObj
class ForgotPasswordController extends GetxController {TextEditingController emailController = TextEditingController();

Rx<ForgotPasswordModel> forgotPasswordModelObj = ForgotPasswordModel().obs;

@override void onClose() { super.onClose(); emailController.dispose(); } 
 }