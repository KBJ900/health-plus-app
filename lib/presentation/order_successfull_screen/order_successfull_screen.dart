// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:diet_recipe_app/core/app_export.dart';
import 'package:diet_recipe_app/data/pref_data/pref_data.dart';
import 'package:diet_recipe_app/widgets/custom_elevated_button.dart';
import 'package:diet_recipe_app/widgets/custom_outlined_button.dart';

import 'controller/order_successfull_controller.dart';

class OrderSuccessfullScreen extends GetWidget<OrderSuccessfullController> {
  const OrderSuccessfullScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return WillPopScope(
      onWillPop:() {
        return backToHome();
      },
      child: Scaffold(
          backgroundColor: theme.colorScheme.onPrimaryContainer,
          body: SafeArea(
            child: Padding(
              padding: getPadding(top: 16),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   Align(
                       alignment: Alignment.centerLeft,
                       child: Padding(
                        padding: getPadding(left: 20),
                        child: Text("msg_order_successfull".tr,
                            style: theme.textTheme.headlineMedium),
                       )),
                    Padding(
                      padding: getPadding(top: 50),
                      child: Column(
                       mainAxisSize: MainAxisSize.min,
                       children: [


                        Align(
                         alignment: Alignment.center,
                         child: CustomImageView(
                             svgPath: ImageConstant.imgTickmark11,
                             height: getSize(132),
                             width: getSize(132)),
                        ),
                        Padding(
                            padding: getPadding(top: 21),
                            child: Text("lbl_order_placed".tr,
                                style: theme.textTheme.titleLarge)),
                        Container(
                            width: getHorizontalSize(334),
                            margin: getMargin(left: 27, top: 13, right: 26),
                            child: Text("msg_our_order_was_placed".tr,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: theme.textTheme.bodyLarge!
                                    .copyWith(height: 1.56))),
                       ],
                      ),
                    ),


                    Column(
                     mainAxisSize: MainAxisSize.min,
                     children: [
                      CustomElevatedButton(
                       onTap: () {
                         PrefData.currentIndex =0;
                         Get.toNamed(AppRoutes.homeScreenContainerScreen);
                       },
                          text: "lbl_go_to_home".tr,
                       margin: getMargin(left: 20,right: 20),
                          ),
                      CustomOutlinedButton(
                          text: "lbl_track_order".tr,
                          margin: getMargin(top: 16, bottom: 40,left: 20,right: 20),
                          buttonStyle: CustomButtonStyles.outlinePrimary,
                          onTap: () {
                           onTapTrackorder();
                          })
                     ],
                    )
                  ]),
            ),
          )),
    );
  }


  onTapTrackorder() {
    Get.toNamed(
      AppRoutes.trackOrderOneScreen,
    );
  }

  backToHome(){
    PrefData.currentIndex =0;
    controller.update();
    Get.toNamed(AppRoutes.homeScreenContainerScreen);
  }
}
