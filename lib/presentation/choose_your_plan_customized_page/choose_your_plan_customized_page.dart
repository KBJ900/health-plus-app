import 'package:flutter/material.dart';
import 'package:diet_recipe_app/core/app_export.dart';
import 'package:diet_recipe_app/presentation/choose_your_plan_standard_one_page/widget/selected_data.dart';
import 'package:diet_recipe_app/widgets/custom_elevated_button.dart';

import '../../data/pref_data/pref_data.dart';
import 'controller/choose_your_plan_customized_controller.dart';

// ignore: must_be_immutable
class ChooseYourPlanCustomizedPage extends StatelessWidget {
  ChooseYourPlanCustomizedPage({Key? key})
      : super(
          key: key,
        );

  ChooseYourPlanCustomizedController controller =
      Get.put(ChooseYourPlanCustomizedController());

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.onPrimaryContainer,
      body: ListView(
        padding: getPadding(left: 20, right: 20, top: 32),
        physics: BouncingScrollPhysics(),
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  margin: getMargin(
                    right: 8,
                  ),
                  padding: getPadding(
                    left: 15,
                    top: 17,
                    right: 15,
                    bottom: 17,
                  ),
                  decoration: AppDecoration.fillTeal5002.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder16,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomImageView(
                        svgPath: ImageConstant.imgMenuBlack900,
                        height: getSize(20),
                        width: getSize(20),
                      ),
                      Padding(
                        padding: getPadding(
                          left: 13,
                        ),
                        child: Text(
                          "lbl_protein_250".tr,
                          style: theme.textTheme.bodyLarge,
                        ),
                      ),
                      CustomImageView(
                        svgPath: ImageConstant.imgPlusBlack90020x20,
                        height: getSize(20),
                        width: getSize(20),
                        margin: getMargin(
                          left: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: getMargin(
                    left: 8,
                  ),
                  padding: getPadding(
                    left: 15,
                    top: 17,
                    right: 15,
                    bottom: 17,
                  ),
                  decoration: AppDecoration.fillCyan50.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder16,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomImageView(
                        svgPath: ImageConstant.imgMenuBlack900,
                        height: getSize(20),
                        width: getSize(20),
                      ),
                      Padding(
                        padding: getPadding(
                          left: 21,
                        ),
                        child: Text(
                          "lbl_carb_150".tr,
                          style: theme.textTheme.bodyLarge,
                        ),
                      ),
                      CustomImageView(
                        svgPath: ImageConstant.imgPlusBlack90020x20,
                        height: getSize(20),
                        width: getSize(20),
                        margin: getMargin(
                          left: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SelectedData(),
          GetBuilder<ChooseYourPlanCustomizedController>(
            builder: (controller) {
              return CustomElevatedButton(
                onTap: () {
                  PrefData.currentIndex = 3;
                  controller.update();
                  Get.toNamed(AppRoutes.homeScreenContainerScreen);
                  controller.update();
                },
                text: "lbl_continue".tr,
                margin: getMargin(top: 32, bottom: 40),
              );
            },
            init: ChooseYourPlanCustomizedController(),
          )
        ],
      ),
    );
  }
}
