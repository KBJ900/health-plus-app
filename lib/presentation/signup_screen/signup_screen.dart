import 'package:flutter/material.dart';
import 'package:diet_recipe_app/core/app_export.dart';
import 'package:diet_recipe_app/core/utils/validation_functions.dart';
import 'package:diet_recipe_app/widgets/custom_elevated_button.dart';
import 'package:diet_recipe_app/widgets/custom_text_form_field.dart';

import 'controller/signup_controller.dart';

// ignore_for_file: must_be_immutable
class SignupScreen extends GetWidget<SignupController> {
  SignupScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: theme.colorScheme.onPrimaryContainer,
        body : Form(
            key: _formKey,
            child: Container(
              child: Column(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgTopView,

                  ),
                  Center(
                    child: Text("lbl_signup2".tr,
                        style: theme.textTheme.displayMedium),
                  ),
                  Center(
                    child: Padding(
                        padding: getPadding(top: 16 ),
                        child: Text("msg_join_us_on_an_exciting".tr,
                            style: theme.textTheme.bodyLarge)),
                  ),
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.zero,

                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                         Column(children: [

                           // SizedBox(
                           //   height: getSize(220),
                           // ),

                           Padding(
                             padding: getPadding( top:32,bottom: 24),
                             child: CustomTextFormField(

                                 controller: controller.firstNameController,
                                 // margin: getMargin(left: 20, top: 48, right: 20),
                                 hintText: "lbl_first_name".tr,
                                 hintStyle: CustomTextStyles.bodyLargeOnError_1,
                                 validator: (value) {
                                   if (value ==null || value.isEmpty) {
                                     return "Please enter valid name";
                                   }
                                   return null;
                                 }),
                           ),
                           CustomTextFormField(
                               controller: controller.lastNameController,
                               margin: getMargin(left: 20, top: 24, right: 20),
                               hintText: "lbl_last_name".tr,
                               hintStyle: CustomTextStyles.bodyLargeOnError_1,
                               validator: (value) {
                                 if (value ==null || value.isEmpty) {
                                   return "Please enter valid surname";
                                 }
                                 return null;
                               }),
                           Padding(
                             padding: getPadding(top: 24,bottom: 24),
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
                                 }),
                           ),

                           Obx(() => CustomTextFormField(
                               textStyle: theme.textTheme.bodyLarge,
                               autofocus: false,
                               controller: controller.passwordController,
                               margin: getMargin(top: 40,),
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
                                           left: 30,
                                           top: 16,
                                           right: 16,
                                           bottom: 16),
                                       child: CustomImageView(
                                           svgPath:
                                           controller.isShowPassword.value
                                               ? ImageConstant.imgEye
                                               : ImageConstant.imgEye))),
                               suffixConstraints: BoxConstraints(
                                   maxHeight: getVerticalSize(57)),
                               validator: (value) {
                                 if (value == null || value.isEmpty) {
                                   return "Please enter valid password";
                                 }
                                 return null;
                               },
                               obscureText: controller.isShowPassword.value,
                               contentPadding:
                               getPadding( top: 18, bottom: 18))),
                           CustomElevatedButton(
                               text: "lbl_signup2".tr,
                               margin: getMargin(left: 20, top: 48, right: 20),
                               onTap: () {
                                 if(_formKey.currentState!.validate()){
                                   controller.firstNameController.clear();
                                   controller.lastNameController.clear();
                                   controller.emailController.clear();
                                   controller.passwordController.clear();
                                   onTapTxtAlreadyhavean();
                                 }
                                 else{}
                               }
                               ),
                         ],),



                        ]),
                  ),
                  GestureDetector(
                      onTap: () {
                        onTapTxtAlreadyhavean();
                      },
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                            padding: getPadding(bottom: 42),
                            child: RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                      text: "msg_already_have_an2".tr,
                                      style: CustomTextStyles
                                          .bodyLargeOnError),
                                  TextSpan(
                                      text: "lbl_login".tr,
                                      style: CustomTextStyles
                                          .titleMediumPrimary_1)
                                ]),
                                textAlign: TextAlign.left)),
                      ))

                ],
              ),
            ))

    );
  }


  onTapSignup() {
    Get.toNamed(
      AppRoutes.homeScreenContainerScreen,
    );
  }


  onTapTxtAlreadyhavean() {
    Get.toNamed(
      AppRoutes.loginScreen,
    );
  }
}


