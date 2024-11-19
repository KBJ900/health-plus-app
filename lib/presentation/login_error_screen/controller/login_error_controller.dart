import 'package:diet_recipe_app/core/app_export.dart';import 'package:diet_recipe_app/presentation/login_error_screen/models/login_error_model.dart';import 'package:flutter/material.dart';/// A controller class for the LoginErrorScreen.
///
/// This class manages the state of the LoginErrorScreen, including the
/// current loginErrorModelObj
class LoginErrorController extends GetxController {TextEditingController emailController = TextEditingController();

TextEditingController validpasswordController = TextEditingController();

Rx<LoginErrorModel> loginErrorModelObj = LoginErrorModel().obs;

Rx<bool> isShowPassword = true.obs;

@override void onClose() { super.onClose(); emailController.dispose(); validpasswordController.dispose(); } 
 }
