import 'controller/login_error_controller.dart';import 'package:flutter/material.dart';import 'package:diet_recipe_app/core/app_export.dart';import 'package:diet_recipe_app/core/utils/validation_functions.dart';import 'package:diet_recipe_app/widgets/custom_elevated_button.dart';import 'package:diet_recipe_app/widgets/custom_text_form_field.dart';
// ignore_for_file: must_be_immutable
class LoginErrorScreen extends GetWidget<LoginErrorController> {LoginErrorScreen({Key? key}) : super(key: key);

GlobalKey<FormState> _formKey = GlobalKey<FormState>();

@override Widget build(BuildContext context) { mediaQueryData = MediaQuery.of(context); return SafeArea(child: Scaffold(resizeToAvoidBottomInset: false, backgroundColor: theme.colorScheme.onPrimaryContainer, body: Form(key: _formKey, child: SizedBox(width: double.maxFinite, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [CustomImageView(imagePath: ImageConstant.imgGroup38141, height: getVerticalSize(119), width: getHorizontalSize(428)), Padding(padding: getPadding(top: 57), child: Text("lbl_login".tr, style: theme.textTheme.displayMedium)), Padding(padding: getPadding(top: 19), child: Text("msg_hello_welcome_back".tr, style: theme.textTheme.bodyLarge)), GestureDetector(onTap: () {onTapMasterinput();}, child: Padding(padding: getPadding(left: 20, top: 49, right: 20), child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start, children: [CustomTextFormField(controller: controller.emailController, hintText: "lbl_email_address".tr, hintStyle: CustomTextStyles.bodyLargeOnError_1, textInputType: TextInputType.emailAddress, validator: (value) {if (value == null || (!isValidEmail(value, isRequired: true))) {return "Please enter valid email";} return null;}), Padding(padding: getPadding(top: 6), child: Text("msg_please_enter_your".tr, style: CustomTextStyles.bodyMediumRed700))]))), GestureDetector(onTap: () {onTapMasterinput1();}, child: Padding(padding: getPadding(left: 20, top: 22, right: 20), child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start, children: [Obx(() => CustomTextFormField(controller: controller.validpasswordController, hintText: "lbl_password".tr, hintStyle: CustomTextStyles.bodyLargeOnError_1, textInputAction: TextInputAction.done, textInputType: TextInputType.visiblePassword, suffix: InkWell(onTap: () {controller.isShowPassword.value = !controller.isShowPassword.value;}, child: Container(margin: getMargin(left: 30, top: 16, right: 16, bottom: 16), child: CustomImageView(svgPath: controller.isShowPassword.value ? ImageConstant.imgEye : ImageConstant.imgEye))), suffixConstraints: BoxConstraints(maxHeight: getVerticalSize(57)), validator: (value) {if (value == null || (!isValidPassword(value, isRequired: true))) {return "Please enter valid password";} return null;}, obscureText: controller.isShowPassword.value, contentPadding: getPadding(left: 16, top: 18, bottom: 18))), Padding(padding: getPadding(top: 6), child: Text("msg_please_enter_your".tr, style: CustomTextStyles.bodyMediumRed700))]))), Align(alignment: Alignment.centerRight, child: Padding(padding: getPadding(top: 17, right: 20), child: Text("msg_forgot_password".tr, style: theme.textTheme.bodyLarge))), CustomElevatedButton(text: "lbl_login".tr, margin: getMargin(left: 20, top: 49, right: 20), onTap: () {onTapLogin();}), Spacer(), GestureDetector(onTap: () {onTapTxtDonthaveanaccount();}, child: Padding(padding: getPadding(bottom: 42), child: RichText(text: TextSpan(children: [TextSpan(text: "msg_don_t_have_an_account2".tr, style: CustomTextStyles.bodyLargeOnError), TextSpan(text: "lbl_sign_up".tr, style: CustomTextStyles.titleMediumPrimary_1)]), textAlign: TextAlign.left)))]))))); } 
/// Navigates to the loginFilledScreen when the action is triggered.

/// When the action is triggered, this function uses the [Get] package to
/// push the named route for the loginFilledScreen.
onTapMasterinput() { Get.toNamed(AppRoutes.loginFilledScreen, ); } 
/// Navigates to the loginFilledScreen when the action is triggered.

/// When the action is triggered, this function uses the [Get] package to
/// push the named route for the loginFilledScreen.
onTapMasterinput1() { Get.toNamed(AppRoutes.loginFilledScreen, ); } 
/// Navigates to the homeScreenContainerScreen when the action is triggered.

/// When the action is triggered, this function uses the [Get] package to
/// push the named route for the homeScreenContainerScreen.
onTapLogin() { Get.toNamed(AppRoutes.homeScreenContainerScreen, ); } 
/// Navigates to the signupScreen when the action is triggered.

/// When the action is triggered, this function uses the [Get] package to
/// push the named route for the signupScreen.
onTapTxtDonthaveanaccount() { Get.toNamed(AppRoutes.signupScreen, ); } 
 }
