// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:diet_recipe_app/core/app_export.dart';
import 'package:diet_recipe_app/core/utils/validation_functions.dart';
import 'package:diet_recipe_app/widgets/custom_elevated_button.dart';
import 'package:diet_recipe_app/widgets/custom_text_form_field.dart';
import '../../data/pref_data/pref_data.dart';
import 'controller/login_controller.dart';

// ignore_for_file: must_be_immutable
class LoginScreen extends GetWidget<LoginController> {
  LoginScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return WillPopScope(
      onWillPop: () {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            backgroundColor: Colors.white,
            shape:  RoundedRectangleBorder(borderRadius:
            BorderRadius.all(Radius.circular(16))),
            insetPadding: getPadding(left: 30,right: 30),

            title: Padding(
              padding: getPadding(left: getSize(50),right: getSize(50)),
              child: Text('Are you sure you want to Exit?',style: TextStyle(
                color: Colors.black,
                fontSize: getFontSize(18),
                fontWeight: FontWeight.w600,
              ),),
            ),

            actions: <Widget>[
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Padding(
                        padding: getPadding(bottom: 16,left: 16),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: AppColor.primaryColor,
                                width: getSize(1.5),
                              )
                          ),
                          child: Padding(
                            padding:  getPadding(top: getSize(14),bottom: getSize(14)),
                            child: Center(
                              child: Text(
                                'No',style: TextStyle(
                                color: AppColor.primaryColor,
                                fontSize: getFontSize(18),
                                fontWeight: FontWeight.w700,
                              ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: getSize(20),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: ()  {
                        controller.onExit();
                        controller.update();
                      },
                      child: Padding(
                        padding: getPadding(bottom: 16,right: 16),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color:AppColor.primaryColor,
                          ),
                          child: Padding(
                            padding:  getPadding(top: getSize(14),bottom: getSize(14)),
                            child: Center(
                              child: Text(
                                'Yes',style: TextStyle(
                                color: Colors.white,
                                fontSize: getFontSize(18),
                                fontWeight: FontWeight.w700,
                              ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
        return Future(() => false);
      },
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: theme.colorScheme.onPrimaryContainer,
          body: Form(
              key: _formKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomImageView(
                        imagePath: ImageConstant.imgTopView,

                        ),


                    Expanded(
                      child: ListView(
                        padding: EdgeInsets.zero,
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        children: [
                          Center(
                            child: Padding(
                                padding: getPadding(top: 48),
                                child: Text("lbl_login".tr,
                                    style: theme.textTheme.displayMedium)),
                          ),
                          Center(
                            child: Padding(
                                padding: getPadding(top: 16),
                                child: Text("msg_hello_welcome_back".tr,
                                    style: theme.textTheme.bodyLarge)),
                          ),
                          Padding(
                            padding:getPadding(top: 48,bottom: 24),

                            child: CustomTextFormField(
                              textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: getFontSize(16),
                                fontWeight: FontWeight.w400,
                              ),
                                textInputAction: TextInputAction.next,

                                autofocus: false,
                                controller: controller.emailController,
                                margin: getMargin(left: 20, top: 49, right: 20),
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
                              textInputAction: TextInputAction.done,
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

                          Align(
                              alignment: Alignment.centerRight,
                              child: GestureDetector(
                                  onTap: () {
                                    onTapTxtForgotpassword();
                                  },
                                  child: Padding(
                                      padding: getPadding(top: 19, right: 20),
                                      child: Text("msg_forgot_password".tr,
                                          style: theme.textTheme.bodyLarge)))),
                          CustomElevatedButton(
                              text: "lbl_login".tr,
                              margin: getMargin(left: 20, top: 49, right: 20),
                              onTap: () {
                                if(_formKey.currentState!.validate()){
                                  PrefData.setLogin(false);
                                  onTapLogin();
                                  controller.emailController.clear();
                                  controller.passwordController.clear();
                                  controller.update();
                                }
                                else{

                                }
                              }),
                        ],
                      ),
                    ),



                    GestureDetector(
                        onTap: () {
                          onTapTxtDonthaveanaccount();
                        },
                        child: Padding(
                          padding: getPadding(bottom: 40),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                      text:
                                          "msg_don_t_have_an_account2".tr,
                                      style: CustomTextStyles
                                          .bodyLargeOnError),
                                  TextSpan(
                                      text: "lbl_sign_up".tr,
                                      style: CustomTextStyles
                                          .titleMediumPrimary_1)
                                ]),
                                textAlign: TextAlign.left),
                          ),
                        ))
                  ]))
      ),
    );
  }


  onTapTxtForgotpassword() {
    Get.toNamed(
      AppRoutes.forgotPasswordScreen,
    );
  }


  onTapLogin() {
    Get.toNamed(
      AppRoutes.homeScreenContainerScreen,
    );
  }

  onTapTxtDonthaveanaccount() {
    Get.toNamed(
      AppRoutes.signupScreen,
    );
  }
}
