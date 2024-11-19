// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:diet_recipe_app/core/app_export.dart';
import 'package:diet_recipe_app/core/utils/validation_functions.dart';
import 'package:diet_recipe_app/widgets/app_bar_text.dart';
import 'package:diet_recipe_app/widgets/custom_elevated_button.dart';
import 'package:diet_recipe_app/widgets/custom_text_form_field.dart';
import 'controller/forgot_password_controller.dart';

// ignore_for_file: must_be_immutable
class ForgotPasswordScreen extends GetWidget<ForgotPasswordController> {
  ForgotPasswordScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return WillPopScope(
      onWillPop: () => onTapForgotpassword(),
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: theme.colorScheme.onPrimaryContainer,
          body: SafeArea(
            child: Form(
                key: _formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                     AppBarText(
                       onTap: () {
                         Get.toNamed(AppRoutes.loginScreen);
                       },
                       title: 'Forgot password?',
                     ),
                      Padding(
                        padding: getPadding(left: 20,right: 50,top: 16,bottom: 40),
                        child: Text("msg_please_enter_your2".tr,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.bodyLarge!
                                .copyWith(height: 1.56)),
                      ),
                      CustomTextFormField(
                          controller: controller.emailController,
                          textStyle: theme.textTheme.bodyLarge,

                          hintText: "lbl_email_address".tr,
                          hintStyle: CustomTextStyles.bodyLargeOnError_1,
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null ||
                                (!isValidEmail(value, isRequired: true))) {
                              return "Please enter valid email";
                            }
                            return null;
                          }),
                      CustomElevatedButton(
                          text: "lbl_continue".tr,
                          margin: getMargin(top: 48,left: 20,right: 20 ),
                          onTap: () {
                            if(_formKey.currentState!.validate()){
                              onTapContinue();
                              controller.emailController.clear();
                            }
                            else{

                            }
                          })
                    ])),
          )),
    );
  }


  onTapForgotpassword() {
    Get.toNamed(
      AppRoutes.loginScreen,
    );
  }


  onTapContinue() {
    Get.toNamed(
      AppRoutes.verificationScreen,
    );
  }
}
