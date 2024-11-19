import 'package:flutter/material.dart';

/// A controller class for the VerificationOneScreen.
import 'package:diet_recipe_app/core/app_export.dart';


///
/// This class manages the state of the VerificationOneScreen, including the
/// current verificationOneModelObj
class ResetPasswordController extends GetxController {
  TextEditingController newpasswordController = TextEditingController();

  TextEditingController confirmpasswordController = TextEditingController();



  Rx<bool> isShowPassword = true.obs;

  Rx<bool> isShowPassword1 = true.obs;

  @override
  void onClose() {
    super.onClose();
    newpasswordController.dispose();
    confirmpasswordController.dispose();
  }
}
