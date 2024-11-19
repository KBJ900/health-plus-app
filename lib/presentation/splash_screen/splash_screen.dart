import 'package:flutter/material.dart';
import 'package:diet_recipe_app/core/app_export.dart';

import 'controller/splace_controller.dart';

class SplashScreen extends GetWidget<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            backgroundColor: theme.colorScheme.onPrimaryContainer,
            body: Container(
                width: mediaQueryData.size.width,
                height: mediaQueryData.size.height,
                decoration: BoxDecoration(
                    color: theme.colorScheme.onPrimaryContainer,
                    image: DecorationImage(
                        image: AssetImage(ImageConstant.imgSplacescreen),
                        fit: BoxFit.cover)),
                child: SizedBox(
                    width: double.maxFinite,
                    child: CustomImageView(
                        svgPath: ImageConstant.imgFrame,
                        height: getSize(130),
                        width: getSize(139),
                        alignment: Alignment.center,
                        margin: getMargin(bottom: 5),
                        onTap: () {
                          onTapImgImage();
                        }
                        )
                )
            )
    );
  }

  onTapImgImage() {
    Get.toNamed(
      AppRoutes.onboardingOneScreen,
    );
  }
}
