import 'package:diet_recipe_app/core/app_export.dart';import 'package:diet_recipe_app/presentation/signup_screen/models/signup_model.dart';import 'package:flutter/material.dart';/// A controller class for the SignupScreen.
///
/// This class manages the state of the SignupScreen, including the
/// current signupModelObj
class SignupController extends GetxController {TextEditingController firstNameController = TextEditingController();

TextEditingController lastNameController = TextEditingController();

TextEditingController emailController = TextEditingController();

TextEditingController passwordController = TextEditingController();

Rx<SignupModel> signupModelObj = SignupModel().obs;

Rx<bool> isShowPassword = true.obs;

@override void onClose() { super.onClose(); firstNameController.dispose(); lastNameController.dispose(); emailController.dispose(); passwordController.dispose(); } 
 }
