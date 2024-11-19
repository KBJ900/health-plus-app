import 'package:flutter/material.dart';
import 'package:diet_recipe_app/core/app_export.dart';
import 'package:diet_recipe_app/core/utils/validation_functions.dart';
import 'package:diet_recipe_app/widgets/app_bar_text.dart';
import 'package:diet_recipe_app/widgets/custom_elevated_button.dart';
import 'package:diet_recipe_app/widgets/custom_icon_button.dart';
import 'package:diet_recipe_app/widgets/custom_text_form_field.dart';
import 'controller/edit_profile_controller.dart';

// ignore_for_file: must_be_immutable
class EditProfileScreen extends GetWidget<EditProfileController> {
  EditProfileScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
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
                      title: 'Edit profile',
                      onTap: () => Get.back(),
                    ),
                    Padding(
                      padding: getPadding(top: 24,bottom: 32,left: 20,right: 20),
                      child: Row(children: [
                        SizedBox(
                            height: getSize(100),
                            width: getSize(100),
                            child: Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  CustomImageView(
                                      imagePath:
                                          ImageConstant.imgEllipse225,
                                      height: getSize(100),
                                      width: getSize(100),
                                      radius: BorderRadius.circular(
                                          getHorizontalSize(50)),
                                      alignment: Alignment.center),
                                  CustomIconButton(
                                      height: getSize(40),
                                      width: getSize(40),
                                      padding: getPadding(all: 8),
                                      decoration: IconButtonStyleHelper
                                          .fillGrayTL20,
                                      alignment: Alignment.bottomRight,
                                      child: CustomImageView(
                                          svgPath: ImageConstant
                                              .imgClockBlack900))
                                ])),
                        Padding(
                            padding:
                                getPadding(left: 15, top: 23, bottom: 23),
                            child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("lbl_john_abram2".tr,
                                      style: theme.textTheme.titleMedium),
                                  Padding(
                                      padding: getPadding(top: 11),
                                      child: Text(
                                          "msg_johnabram_gmail_com".tr,
                                          style: theme.textTheme.bodyLarge))
                                ]))
                      ]),
                    ),
                    CustomTextFormField(
                      autofocus: false,
                        controller: controller.firstnameoneController,
                        hintText: "Name".tr,
                        hintStyle: TextStyle(
                          fontSize: getFontSize(16),
                          fontWeight: FontWeight.w400,
                          color: AppColor.grey400,
                        )),
                    Padding(
                      padding: getPadding(top: 16,bottom: 16),
                      child: CustomTextFormField(
                        autofocus: false,
                          controller: controller.lastnameoneController,
                          margin: getMargin(top: 24),
                          hintText: "Surname".tr,
                          hintStyle: TextStyle(
                            fontSize: getFontSize(16),
                            fontWeight: FontWeight.w400,
                            color: AppColor.grey400,
                          )),
                    ),
                    CustomTextFormField(
                      autofocus: false,
                        controller: controller.emailController,
                        margin: getMargin(top: 24, bottom: 5),
                        hintText: "address".tr,
                        hintStyle: TextStyle(
                          fontSize: getFontSize(16),
                          fontWeight: FontWeight.w400,
                          color: AppColor.grey400,
                        ),
                        textInputAction: TextInputAction.done,
                        textInputType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null ||
                              (!isValidEmail(value, isRequired: true))) {
                            return "Please enter valid email";
                          }
                          return null;
                        })
                  ])),
        ),
        bottomNavigationBar: CustomElevatedButton(
            text: "lbl_save".tr,
            margin: getMargin(left: 20, right: 20, bottom: 40),
            onTap: () {
              onTapSave();
            }));
  }

  /// Navigates to the myProfileScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the myProfileScreen.
  onTapEditprofile() {
    Get.toNamed(
      AppRoutes.myProfileScreen,
    );
  }

  /// Navigates to the myProfileScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the myProfileScreen.
  onTapSave() {
    Get.toNamed(
      AppRoutes.myProfileScreen,
    );
  }
}
