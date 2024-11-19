import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:diet_recipe_app/core/utils/size_utils.dart';

import '../../../theme/custom_text_style.dart';
import '../../../theme/theme_helper.dart';

class FoodDetailsChart extends StatelessWidget {
  final String? name;
  const FoodDetailsChart({ this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: getPadding(
        top: 8, bottom: 8),
        child: Column(
            mainAxisAlignment: MainAxisAlignment
                .spaceAround,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment
                  .center,
                  crossAxisAlignment: CrossAxisAlignment
                      .start,
                  children: [
                    Text("lbl_fat".tr,
                        style: theme.textTheme
                            .bodyLarge),
                    Padding(
                        padding: getPadding(
                            left: 39,
                            bottom: 2),
                        child: Text(
                            "lbl_23g".tr,
                            style: CustomTextStyles
                                .bodyMediumPrimary)),
                    Padding(
                        padding: getPadding(
                            left: 8,
                            top: 5,
                            bottom: 10),
                        child: Container(
                            height: getVerticalSize(
                                4),
                            width: getHorizontalSize(
                                124),
                            decoration: BoxDecoration(
                                color: appTheme
                                    .gray200,
                                borderRadius: BorderRadius
                                    .circular(
                                    getHorizontalSize(
                                        2))),
                            child: ClipRRect(
                                borderRadius: BorderRadius
                                    .circular(
                                    getHorizontalSize(
                                        2)),
                                child: LinearProgressIndicator(
                                    value: 0.52,
                                    backgroundColor: appTheme
                                        .gray200,
                                    valueColor: AlwaysStoppedAnimation<
                                        Color>(
                                        theme
                                            .colorScheme
                                            .primary)))))
                  ]),
              Padding(padding: getPadding(
                  top: 17),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment
                          .center,
                      children: [
                        Text("lbl_protein".tr,
                            style: theme
                                .textTheme
                                .bodyLarge),
                        Padding(
                            padding: getPadding(
                                left: 13,
                                top: 3),
                            child: Text(
                                "lbl_45g".tr,
                                style: CustomTextStyles
                                    .bodyMediumPrimary)),
                        Padding(
                            padding: getPadding(
                                left: 8,
                                top: 8,
                                bottom: 7),
                            child: Container(
                                height: getVerticalSize(
                                    4),
                                width: getHorizontalSize(
                                    124),
                                decoration: BoxDecoration(
                                    color: appTheme
                                        .gray200,
                                    borderRadius: BorderRadius
                                        .circular(
                                        getHorizontalSize(
                                            2))),
                                child: ClipRRect(
                                    borderRadius: BorderRadius
                                        .circular(
                                        getHorizontalSize(
                                            2)),
                                    child: LinearProgressIndicator(
                                        value: 0.83,
                                        backgroundColor: appTheme
                                            .gray200,
                                        valueColor: AlwaysStoppedAnimation<
                                            Color>(
                                            theme
                                                .colorScheme
                                                .primary)))))
                      ])),
              Padding(padding: getPadding(
                  top: 16),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment
                          .center,
                      children: [
                        Text("lbl_carbs".tr,
                            style: theme
                                .textTheme
                                .bodyLarge),
                        Padding(
                            padding: getPadding(
                                left: 14,
                                top: 3),
                            child: Text(
                                "lbl_123g".tr,
                                style: CustomTextStyles
                                    .bodyMediumPrimary)),
                        Padding(
                            padding: getPadding(
                                left: 8,
                                top: 8,
                                bottom: 7),
                            child: Container(
                                height: getVerticalSize(
                                    4),
                                width: getHorizontalSize(
                                    124),
                                decoration: BoxDecoration(
                                    color: appTheme
                                        .gray200,
                                    borderRadius: BorderRadius
                                        .circular(
                                        getHorizontalSize(
                                            2))),
                                child: ClipRRect(
                                    borderRadius: BorderRadius
                                        .circular(
                                        getHorizontalSize(
                                            2)),
                                    child: LinearProgressIndicator(
                                        value: 0.41,
                                        backgroundColor: appTheme
                                            .gray200,
                                        valueColor: AlwaysStoppedAnimation<
                                            Color>(
                                            theme
                                                .colorScheme
                                                .primary)))))
                      ]))
            ]));
  }
}
