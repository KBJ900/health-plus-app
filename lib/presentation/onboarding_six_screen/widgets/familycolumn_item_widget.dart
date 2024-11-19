import '../controller/onboarding_six_controller.dart';
import '../models/familycolumn_item_model.dart';
import 'package:flutter/material.dart';
import 'package:diet_recipe_app/core/app_export.dart';

// ignore: must_be_immutable
class FamilycolumnItemWidget extends StatelessWidget {
  FamilycolumnItemWidget(
    this.familycolumnItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  FamilycolumnItemModel familycolumnItemModelObj;

  var controller = Get.find<OnboardingSixController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "lbl_let_eat".tr,
          style: theme.textTheme.headlineMedium,
        ),
        Padding(
          padding: getPadding(
            top: 23,
          ),
          child: Text(
            "msg_the_warmth_and_love".tr,
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
