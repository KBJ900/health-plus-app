import 'package:flutter/material.dart';
import 'package:diet_recipe_app/core/app_export.dart';
import 'package:diet_recipe_app/data/pref_data/pref_data.dart';
import 'package:diet_recipe_app/widgets/app_bar_text.dart';
import 'package:diet_recipe_app/widgets/custom_icon_button.dart';

import 'controller/track_order_one_controller.dart';

class TrackOrderOneScreen extends GetWidget<TrackOrderOneController> {
  const TrackOrderOneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
        backgroundColor: theme.colorScheme.onPrimaryContainer,

        body: SafeArea(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
               AppBarText(
                onTap: () {
                  PrefData.currentIndex =0;
                  Get.toNamed(AppRoutes.homeScreenContainerScreen);

                },
                title: 'Track order',
               ),
                Container(
                 margin: getMargin(top: 16,right: 20,left: 20,bottom: 24),
                    padding: getPadding(
                        left: 16, top: 17, right: 16, bottom: 17),
                    decoration: AppDecoration.fillGray.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder16),
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                    padding: getPadding(top: 1),
                                    child: Text("lbl_chicken_biryani".tr,
                                        style:
                                            theme.textTheme.titleMedium)),
                                Text("lbl_12_00".tr,
                                    style: CustomTextStyles
                                        .titleMediumPrimary)
                              ]),
                          Padding(
                              padding: getPadding(top: 12),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                        padding: getPadding(bottom: 1),
                                        child: Text("lbl_ref_id_2023".tr,
                                            style: theme
                                                .textTheme.bodyLarge)),
                                    Text("msg_last_update_4_minuts".tr,
                                        style: CustomTextStyles
                                            .bodyLargeOnError_1)
                                  ]))
                        ])),
                Container(
                    margin: getMargin(left: 20,right: 20),
                    padding: getPadding(all: 16),
                    decoration: AppDecoration.fillGray.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder16),
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                              padding: getPadding(top: 2, right: 7),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("lbl_date".tr,
                                        style: theme.textTheme.bodyLarge),
                                    Text("lbl_20_march".tr,
                                        style: CustomTextStyles
                                            .bodyLargeOnError_1)
                                  ])),
                          Padding(
                              padding: getPadding(top: 18),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.center,
                                  children: [
                                    CustomImageView(
                                        imagePath:
                                            ImageConstant.imgEllipse8,
                                        height: getSize(40),
                                        width: getSize(40),
                                        radius: BorderRadius.circular(
                                            getHorizontalSize(20))),
                                    Padding(
                                        padding: getPadding(
                                            left: 16, top: 11, bottom: 8),
                                        child: Text("lbl_jane_cooper".tr,
                                            style: theme
                                                .textTheme.bodyLarge)),
                                    Spacer(),
                                    CustomIconButton(
                                        height: getSize(40),
                                        width: getSize(40),
                                        padding: getPadding(all: 8),
                                        decoration: IconButtonStyleHelper
                                            .fillPrimaryTL20,
                                        child: CustomImageView(
                                            svgPath:
                                                ImageConstant.imgCall))
                                  ]))
                        ])),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.trackOrderScreen);
                  },
                  child: Container(
                      margin: getMargin(top: 24,left: 20,right: 20),
                      padding: getPadding(all: 16),
                      decoration: AppDecoration.fillGray.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder16),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                                padding: getPadding(top: 3),
                                child: Text("lbl_live_map".tr,
                                    style: theme.textTheme.titleMedium)),
                            Container(
                                height: getVerticalSize(132),
                                width: double.infinity,
                                margin: getMargin(top: 18),
                                child: Stack(
                                 fit: StackFit.expand,
                                    alignment: Alignment.center,
                                    children: [
                                     Container(alignment: Alignment.center,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                       image: DecorationImage(image: AssetImage(ImageConstant.imgImage1),fit: BoxFit.cover),
                                       borderRadius: BorderRadius.circular(getHorizontalSize(16)),
                                      ),
                                      child: Container(
                                       height: double.infinity,
                                       width: double.infinity,
                                       decoration: BoxDecoration(
                                        color: Color(0x80000000)
                                       ),
                                       child: Center(child: Text('Open',style:TextStyle(
                                        color:AppColor.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: getFontSize(18)
                                       ))),
                                      ),



                                     ),

                                    ]))
                          ])),
                )
              ]),
        ));
  }

  /// Navigates to the orderSuccessfullScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the orderSuccessfullScreen.
  onTapTrackorder() {
    Get.toNamed(
      AppRoutes.orderSuccessfullScreen,
    );
  }

  /// Navigates to the trackOrderScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the trackOrderScreen.
  onTapImgImageoneone() {
    Get.toNamed(
      AppRoutes.trackOrderScreen,
    );
  }
}
