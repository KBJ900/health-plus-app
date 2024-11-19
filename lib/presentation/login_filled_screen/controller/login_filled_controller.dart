import 'package:diet_recipe_app/core/app_export.dart';import 'package:diet_recipe_app/presentation/login_filled_screen/models/login_filled_model.dart';import 'package:flutter/material.dart';/// A controller class for the LoginFilledScreen.
///
/// This class manages the state of the LoginFilledScreen, including the
/// current loginFilledModelObj
class LoginFilledController extends GetxController {TextEditingController emailController = TextEditingController();

TextEditingController eyeController = TextEditingController();

Rx<LoginFilledModel> loginFilledModelObj = LoginFilledModel().obs;

Rx<bool> isShowPassword = true.obs;

@override void onClose() { super.onClose(); emailController.dispose(); eyeController.dispose(); } 
 }
