import 'package:diet_recipe_app/widgets/app_bar_text.dart';

import 'controller/running_plan_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:diet_recipe_app/core/app_export.dart';
import 'package:diet_recipe_app/widgets/custom_elevated_button.dart';
import 'package:diet_recipe_app/widgets/custom_icon_button.dart';

// ignore_for_file: must_be_immutable
class RunningPlanDetailsScreen extends GetWidget<RunningPlanDetailsController> {
  const RunningPlanDetailsScreen({Key? key})
      : super(
          key: key,
        );

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
               onTap: () => Get.back(),
              title: 'Make a grocery',
            ),
            Container(
              margin: getMargin(top: 16),
              decoration: AppDecoration.fillGreen.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder16,
              ),
              child: Container(
                width: getHorizontalSize(388),
                padding: getPadding(
                  left: 16,
                  top: 19,
                  right: 16,
                  bottom: 19,
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: fs.Svg(
                      ImageConstant.imgGroup153,
                    ),
                    fit: BoxFit.contain,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: getPadding(
                        top: 1,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "lbl_running_plan".tr,
                            style: theme.textTheme.titleMedium,
                          ),
                          Padding(
                            padding: getPadding(
                              top: 12,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  "lbl_100".tr,
                                  style: theme.textTheme.bodyLarge,
                                ),
                                Padding(
                                  padding: getPadding(
                                    left: 4,
                                    top: 2,
                                  ),
                                  child: Text(
                                    "lbl_protein".tr,
                                    style:
                                        CustomTextStyles.bodyMediumBlack900,
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(
                                    left: 16,
                                  ),
                                  child: Text(
                                    "lbl_50".tr,
                                    style: theme.textTheme.bodyLarge,
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(
                                    left: 4,
                                    top: 2,
                                  ),
                                  child: Text(
                                    "lbl_carb".tr,
                                    style:
                                        CustomTextStyles.bodyMediumBlack900,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    CustomIconButton(
                      height: getSize(56),
                      width: getSize(56),
                      margin: getMargin(
                        right: 3,
                      ),
                      padding: getPadding(
                        all: 12,
                      ),
                      decoration: IconButtonStyleHelper.fillPrimary,
                      child: CustomImageView(
                        svgPath: ImageConstant.imgIcrunning,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: getMargin(
                top: 24,
                right: 20,left: 20
              ),
              padding: getPadding(
                left: 16,
                top: 18,
                right: 16,
                bottom: 18,
              ),
              decoration: AppDecoration.fillGray.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder16,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "lbl_duration".tr,
                        style: CustomTextStyles.bodyLargeOnError_1,
                      ),
                      Text(
                        "lbl_1_month".tr,
                        style: theme.textTheme.bodyLarge,
                      ),
                    ],
                  ),
                  Padding(
                    padding: getPadding(
                      top: 19,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "lbl_day_per_week".tr,
                          style: CustomTextStyles.bodyLargeOnError_1,
                        ),
                        Text(
                          "msg_5_days_sunday_off".tr,
                          style: theme.textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      top: 19,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: getPadding(
                            bottom: 1,
                          ),
                          child: Text(
                            "lbl_start_date".tr,
                            style: CustomTextStyles.bodyLargeOnError_1,
                          ),
                        ),
                        Text(
                          "lbl_sun_16_may".tr,
                          style: theme.textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      top: 19,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: getPadding(
                            bottom: 1,
                          ),
                          child: Text(
                            "lbl_end_date".tr,
                            style: CustomTextStyles.bodyLargeOnError_1,
                          ),
                        ),
                        Text(
                          "lbl_sun_16_may".tr,
                          style: theme.textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      top: 19,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "lbl_plan_details".tr,
                          style: CustomTextStyles.bodyLargeOnError_1,
                        ),
                        Text(
                          "lbl_3_meals".tr,
                          style: theme.textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      top: 14,
                    ),
                    child: Text(
                      "msg_without_brakfast".tr,
                      style: theme.textTheme.bodyLarge,
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      top: 14,
                    ),
                    child: Text(
                      "msg_2_salad_1_snack".tr,
                      style: theme.textTheme.bodyLarge,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin: getMargin(
                top: 24,
                left: 20,right: 20
              ),
              padding: getPadding(
                all: 16,
              ),
              decoration: AppDecoration.fillGray.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder16,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: getPadding(
                      top: 4,
                    ),
                    child: Text(
                      "lbl_payment_method".tr,
                      style: theme.textTheme.titleMedium,
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      top: 16,
                    ),
                    child: Row(
                      children: [
                        CustomIconButton(
                          height: getSize(40),
                          width: getSize(40),
                          padding: getPadding(
                            all: 8,
                          ),
                          decoration: IconButtonStyleHelper
                              .fillOnPrimaryContainerTL16,
                          child: CustomImageView(
                            svgPath: ImageConstant.imgGooglepay11,
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 16,
                            top: 11,
                            bottom: 8,
                          ),
                          child: Text(
                            "lbl_google_pay".tr,
                            style: theme.textTheme.bodyLarge,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomElevatedButton(
        onTap: () => Get.back(),
        text: "msg_download_invoice".tr,
        margin: getMargin(
          left: 20,
          right: 20,
          bottom: 40,
        ),
      ),
    );
  }
}
