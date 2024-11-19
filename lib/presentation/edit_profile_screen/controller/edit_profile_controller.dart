import 'package:diet_recipe_app/core/app_export.dart';import 'package:diet_recipe_app/presentation/edit_profile_screen/models/edit_profile_model.dart';import 'package:flutter/material.dart';/// A controller class for the EditProfileScreen.
///
/// This class manages the state of the EditProfileScreen, including the
/// current editProfileModelObj
class EditProfileController extends GetxController {TextEditingController firstnameoneController = TextEditingController();

TextEditingController lastnameoneController = TextEditingController();

TextEditingController emailController = TextEditingController();

Rx<EditProfileModel> editProfileModelObj = EditProfileModel().obs;

@override void onClose() { super.onClose(); firstnameoneController.dispose(); lastnameoneController.dispose(); emailController.dispose(); } 
 }
