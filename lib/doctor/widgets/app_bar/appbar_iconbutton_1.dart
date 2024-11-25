import 'package:flutter/material.dart';
import 'package:diet_recipe_app/core/app_export.dart';
import 'package:diet_recipe_app/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class AppbarIconbutton1 extends StatelessWidget {
  AppbarIconbutton1({
    Key? key,
    this.imagePath,
    this.svgPath,
    this.margin,
    this.onTap,
  }) : super(
          key: key,
        );

  String? imagePath;

  String? svgPath;

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
        child: Opacity(
          opacity: 0.4,
          child: CustomIconButton(
            height: getSize(48),
            width: getSize(48),
            padding: getPadding(
              all: 12,
            ),
            decoration: IconButtonStyleHelper.fillBlack,
            child: CustomImageView(
              svgPath: svgPath,
              imagePath: imagePath,
            ),
          ),
        ),
      ),
    );
  }
}
