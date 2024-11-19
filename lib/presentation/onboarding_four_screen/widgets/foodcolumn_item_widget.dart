import '../controller/onboarding_four_controller.dart';
import '../models/foodcolumn_item_model.dart';
import 'package:flutter/material.dart';
import 'package:diet_recipe_app/core/app_export.dart';

// ignore: must_be_immutable
class FoodcolumnItemWidget extends StatelessWidget {
  FoodcolumnItemWidget(
    this.foodcolumnItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  FoodcolumnItemModel foodcolumnItemModelObj;

  var controller = Get.find<OnboardingFourController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "lbl_deliicious_food".tr,
          style: theme.textTheme.headlineMedium,
        ),
        Padding(
          padding: getPadding(
            top: 23,
          ),
          child: Text(
            "msg_arguably_south_india_s".tr,
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
