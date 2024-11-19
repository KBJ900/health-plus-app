import '../onboarding_six_screen/widgets/familycolumn_item_widget.dart';
import 'controller/onboarding_six_controller.dart';
import 'models/familycolumn_item_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:diet_recipe_app/core/app_export.dart';
import 'package:diet_recipe_app/widgets/custom_elevated_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore_for_file: must_be_immutable
class OnboardingSixScreen extends GetWidget<OnboardingSixController> {
  const OnboardingSixScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.onPrimaryContainer,
        body: Container(
          width: double.maxFinite,
          padding: getPadding(
            left: 10,
            top: 48,
            right: 10,
            bottom: 48,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgThaifoodmixed,
                height: getVerticalSize(376),
                width: getHorizontalSize(408),
                margin: getMargin(
                  top: 63,
                ),
              ),
              Padding(
                padding: getPadding(
                  left: 32,
                  top: 89,
                  right: 32,
                ),
                child: Obx(
                  () => CarouselSlider.builder(
                    options: CarouselOptions(
                      height: getVerticalSize(101),
                      initialPage: 0,
                      autoPlay: true,
                      viewportFraction: 1.0,
                      enableInfiniteScroll: false,
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (
                        index,
                        reason,
                      ) {
                        controller.sliderIndex.value = index;
                      },
                    ),
                    itemCount: controller.onboardingSixModelObj.value
                        .familycolumnItemList.value.length,
                    itemBuilder: (context, index, realIndex) {
                      FamilycolumnItemModel model = controller
                          .onboardingSixModelObj
                          .value
                          .familycolumnItemList
                          .value[index];
                      return FamilycolumnItemWidget(
                        model,
                      );
                    },
                  ),
                ),
              ),
              Obx(
                () => Container(
                  height: getVerticalSize(8),
                  margin: getMargin(
                    top: 42,
                  ),
                  child: AnimatedSmoothIndicator(
                    activeIndex: controller.sliderIndex.value,
                    count: controller.onboardingSixModelObj.value
                        .familycolumnItemList.value.length,
                    axisDirection: Axis.horizontal,
                    effect: ScrollingDotsEffect(
                      spacing: 8,
                      activeDotColor: theme.colorScheme.primary,
                      dotColor: appTheme.blueGray100,
                      dotHeight: getVerticalSize(8),
                      dotWidth: getHorizontalSize(8),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: CustomElevatedButton(
          text: "lbl_get_started".tr,
          margin: getMargin(
            left: 20,
            right: 20,
            bottom: 48,
          ),
        ),
      ),
    );
  }
}
