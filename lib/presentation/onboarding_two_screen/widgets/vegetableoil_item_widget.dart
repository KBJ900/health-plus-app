import '../controller/onboarding_two_controller.dart';
import '../models/vegetableoil_item_model.dart';
import 'package:flutter/material.dart';
import 'package:diet_recipe_app/core/app_export.dart';

// ignore: must_be_immutable
class VegetableoilItemWidget extends StatelessWidget {
  VegetableoilItemWidget(
    this.vegetableoilItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  VegetableoilItemModel vegetableoilItemModelObj;

  var controller = Get.find<OnboardingTwoController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "lbl_healthy_testy".tr,
          style: theme.textTheme.headlineMedium,
        ),
        Padding(
          padding: getPadding(
            top: 20,
          ),
          child: Text(
            "msg_emami_agrotech_produces".tr,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: CustomTextStyles.bodyLargeOnError_1.copyWith(
              height: 1.56,
            ),
          ),
        ),
      ],
    );
  }
}
