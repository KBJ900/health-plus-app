import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:diet_recipe_app/theme/app_decoration.dart';

import '../../../../core/utils/image_constant.dart';
import '../../../../core/utils/size_utils.dart';
import '../../../../theme/custom_text_style.dart';
import '../../../../theme/theme_helper.dart';
import '../../../widgets_doctor/custom_image_view.dart';

class HealthyDoctorMenuBanner extends StatelessWidget {
  final String?title;
  const HealthyDoctorMenuBanner({ this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: getMargin( right: 20,left: 20),
        decoration: AppDecoration.fillDeepOrange
            .copyWith(
            borderRadius: BorderRadiusStyle
                .roundedBorder16),
        child: Container(
            width: getHorizontalSize(388),
            padding: getPadding(
                left: 16,
                top: 9,
                right: 16,
                bottom: 9),
            decoration: BoxDecoration(
                borderRadius:
                BorderRadiusStyle.roundedBorder16,
                image: DecorationImage(
                    image: AssetImage(
                        ImageConstant.homeBanner,
                    ),
                    fit: BoxFit.cover,

                )),
            child: Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      margin: getMargin(
                          top: 17, bottom: 14),
                      decoration: BoxDecoration(
                          borderRadius:
                          BorderRadiusStyle
                              .roundedBorder16
                      ),
                      child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment
                              .start,
                          mainAxisAlignment:
                          MainAxisAlignment.start,
                          children: [
                            SizedBox(
                                width:
                                getHorizontalSize(
                                    128),
                                child: Text(
                                    "msg_healthy_food_menu"
                                        .tr,
                                    maxLines: 2,
                                    overflow:
                                    TextOverflow
                                        .ellipsis,
                                    style: theme
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(
                                        height:
                                        1.59))),
                            Container(
                                margin: getMargin(
                                    top: 20),
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadiusStyle
                                        .circleBorder12),
                                child: Row(
                                    mainAxisSize:
                                    MainAxisSize
                                        .min,
                                    children: [
                                      Padding(
                                          padding: getPadding(
                                              top: 2,
                                              bottom:
                                              3),
                                          child: Text(
                                              "lbl_order_now"
                                                  .tr,
                                              style: CustomTextStyles
                                                  .titleSmallDeeporangeA700)),
                                      CustomImageView(
                                          svgPath:
                                          ImageConstant
                                              .imgArrowright,
                                          height:
                                          getSize(
                                              24),
                                          width:
                                          getSize(
                                              24),
                                          radius: BorderRadius.circular(
                                              getHorizontalSize(
                                                  12)),
                                          margin: getMargin(
                                              left:
                                              8))
                                    ]))
                          ])),
                  CustomImageView(
                      imagePath: ImageConstant
                          .imgChillipaneerd,
                      height: getVerticalSize(137),
                      width: getHorizontalSize(139),
                      radius: BorderRadius.circular(
                          getHorizontalSize(16)),
                      margin: getMargin(
                          right: 18, bottom: 1))
                ])));
  }
}
