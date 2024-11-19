import 'package:diet_recipe_app/presentation/profile_page/widget/profile_ope.dart';
import 'package:diet_recipe_app/widgets/app_bar_text.dart';
import 'controller/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:diet_recipe_app/core/app_export.dart';

// ignore_for_file: must_be_immutable
class SettingsScreen extends GetWidget<SettingsController> {
  const SettingsScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.onPrimaryContainer,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AppBarText(
              onTap: () => Get.back(),
              title: 'Settings',
            ),
            Padding(
              padding:getPadding(top: 24),
              child: ProfileOpe(
                optionImg: ImageConstant.imgFile,
                optionName: 'About us',
                onTapOption: () {
                  Get.toNamed(AppRoutes.aboutUsScreen);
                },
              ),
            ),
            ProfileOpe(
              onTapOption: () {
                Get.toNamed(AppRoutes.helpScreen);
              },
              optionImg: ImageConstant.imgIchelp,
              optionName: 'Help',
            ),
            ProfileOpe(
              onTapOption: () {
                Get.toNamed(AppRoutes.feedbackScreen);
              },
              optionImg: ImageConstant.imgIcfeedback,
              optionName: 'Feedback',
            ),

          ],
        ),
      ),
    );
  }
}
