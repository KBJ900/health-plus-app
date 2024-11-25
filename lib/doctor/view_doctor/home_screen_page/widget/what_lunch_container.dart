import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:diet_recipe_app/core/utils/size_utils.dart';
import 'package:diet_recipe_app/theme/app_decoration.dart';
import '../../../../core/utils/image_constant.dart';
import '../../../../theme/custom_text_style.dart';
import '../../../../theme/theme_helper.dart';
import '../../../widgets_doctor/custom_image_view.dart';

class WhatLunchContainer extends StatelessWidget {
  final String? img;
  final String? name;
  final String? time;
  final String? kcal;
  const WhatLunchContainer({ this.img, this.name, this.time, this.kcal});

  @override
  Widget build(BuildContext context) {
    return Container(

        padding: getPadding(all: 8),

        decoration: AppDecoration.fillGray
            .copyWith(
            borderRadius:
            BorderRadiusStyle
                .roundedBorder16),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment:
            CrossAxisAlignment.start,
            mainAxisAlignment:
            MainAxisAlignment.start,
            children: [
              CustomImageView(
                  imagePath:img?? ImageConstant
                      .imgRectangle728,
                  height:
                  getSize(146),
                  width: getSize(
                      215),
                  radius:
                  BorderRadius.circular(
                      getHorizontalSize(
                          16))),
              Padding(
                  padding:
                  getPadding(top: 8),
                  child: Text(name??
                      "lbl_pencage_blues".tr,
                      style: theme.textTheme
                          .titleMedium
                  )
              ),
              Padding(
                  padding: getPadding(
                    top: 8,),
                  child: Row(children: [
                    CustomImageView(
                        svgPath:
                        ImageConstant
                            .imgClock,
                        height: getSize(20),
                        width: getSize(20)),
                    Padding(
                        padding: getPadding(
                            left: 4),
                        child: Text(time??
                            "lbl_30_mins"
                                .tr,
                            style: CustomTextStyles
                                .bodyLargeOnError_1)),
                    CustomImageView(
                        svgPath:
                        ImageConstant
                            .imgIcfire,
                        height: getSize(20),
                        width: getSize(20),
                        margin: getMargin(
                            left: 16)),
                    Padding(
                        padding: getPadding(
                            left: 4),
                        child: Text(kcal??
                            "lbl_21_kcal"
                                .tr,
                            style: CustomTextStyles
                                .bodyLargeOnError_1))
                  ]
                  )
              )
            ]));
  }
}
