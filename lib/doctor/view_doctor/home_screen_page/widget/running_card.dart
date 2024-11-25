import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:diet_recipe_app/core/utils/size_utils.dart';

import '../../../../core/utils/image_constant.dart';
import '../../../../theme/app_decoration.dart';
import '../../../../theme/custom_text_style.dart';
import '../../../../theme/theme_helper.dart';
import '../../../../widgets/custom_icon_button.dart';
import '../../../widgets/custom_image_view.dart';

class RunningCard extends StatelessWidget {
  final String? txt;
  const RunningCard({ this.txt});

  @override
  Widget build(BuildContext context) {
    return Card(
        clipBehavior: Clip.antiAlias,
        elevation: 0,
        margin: getMargin(left: 20,right: 20),
        color: appTheme.green50,
        shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadiusStyle.roundedBorder16),
        child: Container(
            height: getSize(125),

            decoration: AppDecoration.fillGreen
                .copyWith(
                borderRadius: BorderRadiusStyle
                    .roundedBorder16),
            child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                      alignment: Alignment.center,
                      child: Padding(
                          padding: getPadding(
                              left: 16,
                              top: 19,
                              right: 16,
                              bottom: 15),
                          child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment
                                  .spaceBetween,
                              children: [
                                Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment
                                        .start,
                                    mainAxisAlignment:
                                    MainAxisAlignment
                                        .start,
                                    children: [
                                      Text(
                                          "lbl_running_plan"
                                              .tr,
                                          style: theme
                                              .textTheme
                                              .titleMedium),
                                      Padding(
                                          padding:
                                          getPadding(
                                              top:
                                              9),
                                          child: Text(
                                              "msg_end_date_12_july"
                                                  .tr,
                                              style: theme
                                                  .textTheme
                                                  .bodyMedium)),
                                      Padding(
                                          padding:
                                          getPadding(
                                              top:
                                              10),
                                          child: Row(
                                              children: [
                                                Text(
                                                    "lbl_100".tr,
                                                    style: theme.textTheme.bodyLarge),
                                                Padding(
                                                    padding: getPadding(left: 4, top: 2),
                                                    child: Text("lbl_protein".tr, style: CustomTextStyles.bodyMediumBlack900)),
                                                Padding(
                                                    padding: getPadding(left: 16),
                                                    child: Text("lbl_50".tr, style: theme.textTheme.bodyLarge)),
                                                Padding(
                                                    padding: getPadding(left: 4, top: 2),
                                                    child: Text("lbl_carb".tr, style: CustomTextStyles.bodyMediumBlack900))
                                              ]))
                                    ]),
                                Container(
                                    height:
                                    getSize(62),
                                    width:
                                    getSize(62),
                                    padding: getPadding(
                                        all: 3),
                                    decoration: AppDecoration
                                        .outlinePrimary
                                        .copyWith(
                                        borderRadius:
                                        BorderRadiusStyle
                                            .circleBorder31),
                                    child: CustomIconButton(
                                        height:
                                        getSize(
                                            56),
                                        width: getSize(
                                            56),
                                        padding:
                                        getPadding(
                                            all:
                                            12),
                                        decoration:
                                        IconButtonStyleHelper
                                            .fillPrimary,
                                        alignment:
                                        Alignment
                                            .center,
                                        child: CustomImageView(
                                            svgPath:
                                            ImageConstant
                                                .imgTrash)))
                              ]))),
                  CustomImageView(
                      svgPath:
                      ImageConstant.imgMaskgroup,
                      height: getVerticalSize(117),
                      width: getHorizontalSize(388),
                      alignment: Alignment.center)
                ])));
  }
}
