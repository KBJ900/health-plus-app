import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A controller class for the LoginScreen.
import 'package:diet_recipe_app/core/app_export.dart';
import 'package:diet_recipe_app/presentation/login_screen/models/login_model.dart';


class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  Rx<LoginModel> loginModelObj = LoginModel().obs;

  Rx<bool> isShowPassword = true.obs;


  onExit() {
   if (Platform.isIOS) {
    exit(0);
   } else {
    SystemNavigator.pop();
   }
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
  }
}
