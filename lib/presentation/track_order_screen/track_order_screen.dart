import 'package:flutter/material.dart';
import 'package:diet_recipe_app/core/app_export.dart';
import 'package:diet_recipe_app/widgets/custom_floating_button.dart';

import 'controller/track_order_controller.dart';

class TrackOrderScreen extends GetWidget<TrackOrderController> {
  const TrackOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
        // extendBody: true,
        extendBodyBehindAppBar: true,
        backgroundColor: theme.colorScheme.onPrimaryContainer,
        body: Container(
            width: mediaQueryData.size.width,
            height: mediaQueryData.size.height,
            decoration: BoxDecoration(
                color: theme.colorScheme.onPrimaryContainer,
                image: DecorationImage(
                    image: AssetImage(ImageConstant.imgTrackorder),
                    fit: BoxFit.cover)),
            child: Container(
                width: double.maxFinite,
                padding: getPadding(left: 20, top: 16, right: 20, bottom: 16),
                child: SafeArea(
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomImageView(
                            svgPath: ImageConstant.imgArrowleft,
                            height: getSize(24),
                            width: getSize(24),
                            onTap: () {
                              onTapImgArrowleftone();
                            }),
                        // Spacer(),
                        Container(
                            height: getSize(334),
                            width: getSize(165),
                            margin: getMargin(left: 95,top: 330),
                            child:
                                Stack(alignment: Alignment.topRight, children: [
                              CustomImageView(
                                  svgPath: ImageConstant.imgVector2,
                                  height: getVerticalSize(257),
                                  width: getHorizontalSize(120),
                                  alignment: Alignment.topRight,
                                  margin: getMargin(top: 32)),
                              Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                      height: getSize(35),
                                      width: getSize(35),
                                      margin: getMargin(right: 25),
                                      child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            CustomImageView(
                                                svgPath: ImageConstant.imgSave,
                                                height: getSize(35),
                                                width: getSize(35),
                                                alignment: Alignment.center),
                                            CustomImageView(
                                                svgPath: ImageConstant
                                                    .imgSignalBlack900,
                                                height: getSize(18),
                                                width: getSize(18),
                                                alignment: Alignment.center)
                                          ]))),
                              Align(
                                  alignment: Alignment.bottomLeft,
                                  child: SizedBox(
                                      height: getSize(52),
                                      width: getSize(52),
                                      child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Align(
                                                alignment: Alignment.center,
                                                child: Container(
                                                    height: getSize(51),
                                                    width: getSize(51),
                                                    decoration: BoxDecoration(
                                                        color: theme.colorScheme
                                                            .onPrimaryContainer,
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                getHorizontalSize(
                                                                    25)),
                                                        boxShadow: [
                                                          BoxShadow(
                                                              color: appTheme
                                                                  .black900
                                                                  .withOpacity(
                                                                      0.1),
                                                              spreadRadius:
                                                                  getHorizontalSize(
                                                                      2),
                                                              blurRadius:
                                                                  getHorizontalSize(
                                                                      2),
                                                              offset:
                                                                  Offset(0, 4))
                                                        ]))),
                                            CustomImageView(
                                                imagePath: ImageConstant
                                                    .imgEllipse852x52,
                                                height: getSize(52),
                                                width: getSize(52),
                                                radius: BorderRadius.circular(
                                                    getHorizontalSize(26)),
                                                alignment: Alignment.center)
                                          ])))
                            ]))
                      ]),
                ))),
        floatingActionButton: CustomFloatingButton(
            height: 56,
            width: 56,
            backgroundColor: theme.colorScheme.primary,
            child: CustomImageView(
                svgPath: ImageConstant.imgSearch,
                height: getVerticalSize(28.0),
                width: getHorizontalSize(28.0))));
  }

  /// Navigates to the previous screen.
  ///
  /// When the action is triggered, this function uses the [Get] package to
  /// navigate to the previous screen in the navigation stack.
  onTapImgArrowleftone() {
    Get.back();
  }
}
