import '../controller/onboarding_five_controller.dart';
import '../models/sliderhealthyta_item_model.dart';
import 'package:flutter/material.dart';
import 'package:diet_recipe_app/core/app_export.dart';

// ignore: must_be_immutable
class SliderhealthytaItemWidget extends StatelessWidget {
  SliderhealthytaItemWidget(
    this.sliderhealthytaItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  SliderhealthytaItemModel sliderhealthytaItemModelObj;

  var controller = Get.find<OnboardingFiveController>();

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
