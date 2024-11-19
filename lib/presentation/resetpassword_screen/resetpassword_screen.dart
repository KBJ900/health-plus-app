// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:diet_recipe_app/core/app_export.dart';
import 'package:diet_recipe_app/widgets/app_bar_text.dart';
import 'package:diet_recipe_app/widgets/custom_elevated_button.dart';
import 'package:diet_recipe_app/widgets/custom_text_form_field.dart';

import 'controller/resetpassword_controller.dart';

// ignore_for_file: must_be_immutable
class ResetPasswordScreen extends GetWidget<ResetPasswordController> {
  ResetPasswordScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return WillPopScope(
      onWillPop: () => onTapResetpassword(),
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
                          Get.toNamed(AppRoutes.forgotPasswordScreen);
                        },
                        title: 'Reset password',
                      ),
                      Padding(
                        padding: getPadding(top: 16,left: 20,right: 50,bottom: 40),
                        child: Text("msg_please_enter_your3".tr,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.bodyLarge!
                                .copyWith(height: 1.56)),
                      ),
                      Obx(() => Padding(
                        padding: getPadding(bottom: 24),
                        child: CustomTextFormField(
                          autofocus: false,
                            controller: controller.newpasswordController,
                            margin: getMargin(top: 40,),
                            hintText: "lbl_new_password".tr,
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
                                getPadding( top: 18, bottom: 18)),
                      )),
                      Obx(() => CustomTextFormField(
                        autofocus: false,
                          controller: controller.confirmpasswordController,
                          margin: getMargin(top: 24),
                          hintText: "msg_confirm_password".tr,
                          hintStyle: CustomTextStyles.bodyLargeOnError_1,
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.visiblePassword,
                          suffix: InkWell(
                              onTap: () {
                                controller.isShowPassword1.value =
                                    !controller.isShowPassword1.value;
                              },
                              child: Container(
                                  margin: getMargin(
                                      left: 30,
                                      top: 16,
                                      right: 16,
                                      bottom: 16),
                                  child: CustomImageView(
                                      svgPath:
                                          controller.isShowPassword1.value
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
                          obscureText: controller.isShowPassword1.value,
                          contentPadding:
                              getPadding( top: 18, bottom: 18))),
                      CustomElevatedButton(
                          text: "lbl_create".tr,
                          margin: getMargin(top: 48,left: 20,right: 20),
                          onTap: () {
                           if(_formKey.currentState!.validate()){
                             controller.newpasswordController.clear();
                             controller.confirmpasswordController.clear();
                             showDialog<String>(
                               context: context,
                               builder: (BuildContext context) => AlertDialog(
                                 backgroundColor:AppColor.white,
                                 shape:  RoundedRectangleBorder(borderRadius:
                                 BorderRadius.all(Radius.circular(getHorizontalSize(24)))),
                                 insetPadding: getPadding(left: 20,right: 20),
                                 title: Column(
                                   children: [
                                     CustomImageView(
                                       svgPath: ImageConstant.imgPassDone,
                                       height: getSize(132),
                                     ),
                                     SizedBox(
                                       height:getSize(10),
                                     ),
                                     Text('Password changed!',style: TextStyle(
                                       color: AppColor.black,
                                       fontSize: getFontSize(22),
                                       fontWeight: FontWeight.w700,
                                     ),)
                                   ],
                                 ),
                                 content:  Text('Your password has been changed successfully. use your new password to login',style: TextStyle(
                                   color:AppColor.black,
                                   fontSize: getFontSize(16),
                                   fontWeight: FontWeight.w400,
                                 ),textAlign: TextAlign.center),
                                 actions: <Widget>[
                                   Padding(
                                     padding:  getPadding(left: 10,right: 10,bottom: 15),
                                     child: GestureDetector(
                                       onTap: () {
                                         Get.toNamed(AppRoutes.loginScreen);
                                       },
                                       child:Container(
                                         alignment: Alignment.center,
                                         decoration: BoxDecoration(
                                           color: AppColor.primaryColor,
                                           borderRadius: BorderRadius.circular(getHorizontalSize(16))
                                         ),
                                         child: Padding(
                                           padding:getPadding(top: 13,bottom: 13),
                                           child: Text('ok',style: TextStyle(
                                             color: AppColor.white,
                                             fontWeight: FontWeight.w700,
                                             fontSize: getFontSize(18),
                                           ),),
                                         ),
                                       )
                                     ),
                                   )
                                 ],
                               ),
                             );
                           }
                           else{

                           }
                          }
                          )
                    ]
                )
            ),
          )
      ),
    );
  }


  onTapResetpassword() {
    Get.toNamed(
      AppRoutes.forgotPasswordScreen,
    );
  }


  onTapCreate() {
    Get.toNamed(
      AppRoutes.verificationConfirmScreen,
    );
  }
}
