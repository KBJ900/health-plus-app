import 'package:flutter/material.dart';
import 'package:diet_recipe_app/core/app_export.dart';
import 'package:diet_recipe_app/widgets/custom_elevated_button.dart';

// ignore: must_be_immutable
class AppbarButton extends StatelessWidget {
  AppbarButton({
    Key? key,
    this.margin,
    this.onTap,
  }) : super(
          key: key,
        );

  EdgeInsetsGeometry? margin;

  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap?.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: CustomElevatedButton(
          height: getVerticalSize(34),
          width: getHorizontalSize(170),
          text: "msg_forgot_password".tr,
          leftIcon: Container(
            margin: getMargin(
              right: 16,
            ),
            child: CustomImageView(
              svgPath: ImageConstant.imgArrowleft,
            ),
          ),
          buttonStyle: CustomButtonStyles.none,
          buttonTextStyle: theme.textTheme.headlineMedium!,
        ),
      ),
    );
  }
}