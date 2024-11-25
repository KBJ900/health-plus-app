import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:diet_recipe_app/core/utils/size_utils.dart';

import '../../../core/utils/image_constant.dart';
import '../../../routes/app_routes.dart';
import '../../../theme/app_decoration.dart';
import '../../../theme/theme_helper.dart';
import '../../../widgets/custom_icon_button.dart';
import '../../../widgets/custom_image_view.dart';

class HomeOption extends StatelessWidget {
  final String? txt;
   HomeOption({ this.txt});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: getPadding(left: 20,right: 20,top: 24,bottom: 24),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: GestureDetector(
                  onTap: () {
                    onTapColumncalendar();
                  },
                  child: Container(
                      padding: getPadding(top: 16,bottom: 16),
                      decoration: AppDecoration.fillPurple
                          .copyWith(
                          borderRadius:
                          BorderRadiusStyle
                              .roundedBorder16),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment:
                          MainAxisAlignment.center,
                          children: [
                            CustomIconButton(
                                height: getSize(56),
                                width: getSize(56),
                                padding:
                                getPadding(all: 16),
                                decoration:
                                IconButtonStyleHelper
                                    .fillOnPrimaryContainer,
                                child: CustomImageView(
                                    svgPath: ImageConstant
                                        .imgCalendar)),
                            Padding(
                                padding:
                                getPadding(top: 11),
                                child: Text(
                                    "lbl_move_day".tr,
                                    style: theme.textTheme
                                        .bodyLarge))
                          ]))),
            ),
            SizedBox(
              width: getSize(20),
            ),
            Expanded(
              child: GestureDetector(
                  onTap: () {
                    onTapColumnplusone();
                  },
                  child: Container(
                      padding: getPadding(top: 16,bottom: 16),
                      decoration: AppDecoration.fillTeal
                          .copyWith(
                          borderRadius:
                          BorderRadiusStyle
                              .roundedBorder16),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment:
                          MainAxisAlignment.center,
                          children: [
                            CustomIconButton(
                                height: getSize(56),
                                width: getSize(56),
                                padding:
                                getPadding(all: 16),
                                decoration:
                                IconButtonStyleHelper
                                    .fillOnPrimaryContainer,
                                child: CustomImageView(
                                    svgPath: ImageConstant
                                        .imgPlus)),
                            Padding(
                                padding: getPadding(
                                    top: 10, bottom: 2),
                                child: Text(
                                    "lbl_add_menu".tr,
                                    style: theme.textTheme
                                        .bodyLarge))
                          ]))),
            ),
            SizedBox(
              width: getSize(20),
            ),
            Expanded(
              child: GestureDetector(
                  onTap: () {
                    onTapColumnsignal();
                  },
                  child: Container(
                      padding: getPadding(top: 16,bottom: 16),
                      decoration: AppDecoration.fillCyan
                          .copyWith(
                          borderRadius:
                          BorderRadiusStyle
                              .roundedBorder16),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment:
                          MainAxisAlignment.center,
                          children: [
                            CustomIconButton(
                                height: getSize(56),
                                width: getSize(56),
                                padding:
                                getPadding(all: 16),
                                decoration:
                                IconButtonStyleHelper
                                    .fillOnPrimaryContainer,
                                child: CustomImageView(
                                    svgPath: ImageConstant
                                        .imgSignal)),
                            Padding(
                                padding:
                                getPadding(top: 11),
                                child: Text(
                                    "lbl_delivery".tr,
                                    style: theme.textTheme
                                        .bodyLarge))
                          ]))),
            )
          ]),
    );
  }

  onTapColumncalendar() {
    Get.toNamed(
      AppRoutes.moveDaysScreen,
    );
  }


  onTapColumnplusone() {
    Get.toNamed(
      AppRoutes.addMenuTabContainerScreen,
    );
  }


  onTapColumnsignal() {
    Get.toNamed(
      AppRoutes.changeDeliveryAddressScreen,
    );
  }

}
