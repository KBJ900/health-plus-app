import '../onboarding_five_screen/widgets/sliderhealthyta_item_widget.dart';
import 'controller/onboarding_five_controller.dart';
import 'models/sliderhealthyta_item_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:diet_recipe_app/core/app_export.dart';
import 'package:diet_recipe_app/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:diet_recipe_app/widgets/app_bar/custom_app_bar.dart';
import 'package:diet_recipe_app/widgets/custom_elevated_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore_for_file: must_be_immutable
class OnboardingFiveScreen extends GetWidget<OnboardingFiveController> {
  const OnboardingFiveScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.onPrimaryContainer,
        appBar: CustomAppBar(
          actions: [
            AppbarSubtitle1(
              text: "lbl_skip".tr,
              margin: getMargin(
                left: 20,
                top: 18,
                right: 20,
                bottom: 17,
              ),
            ),
          ],
        ),
        body: Container(
          width: double.maxFinite,
          padding: getPadding(
            left: 24,
            top: 6,
            right: 24,
            bottom: 6,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgSchezwannoodle,
                height: getVerticalSize(474),
                width: getHorizontalSize(379),
              ),
              Padding(
                padding: getPadding(
                  left: 22,
                  top: 40,
                  right: 22,
                ),
                child: Obx(
                  () => CarouselSlider.builder(
                    options: CarouselOptions(
                      height: getVerticalSize(102),
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
                    itemCount: controller.onboardingFiveModelObj.value
                        .sliderhealthytaItemList.value.length,
                    itemBuilder: (context, index, realIndex) {
                      SliderhealthytaItemModel model = controller
                          .onboardingFiveModelObj
                          .value
                          .sliderhealthytaItemList
                          .value[index];
                      return SliderhealthytaItemWidget(
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
                    top: 39,
                    bottom: 5,
                  ),
                  child: AnimatedSmoothIndicator(
                    activeIndex: controller.sliderIndex.value,
                    count: controller.onboardingFiveModelObj.value
                        .sliderhealthytaItemList.value.length,
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
          text: "lbl_next".tr,
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
