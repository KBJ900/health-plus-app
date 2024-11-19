import '../controller/check_out_controller.dart';
import '../models/fooditem_item_model.dart';
import 'package:flutter/material.dart';
import 'package:diet_recipe_app/core/app_export.dart';
import 'package:diet_recipe_app/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class FooditemItemWidget extends StatelessWidget {
  FooditemItemWidget(
    this.fooditemItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  FooditemItemModel fooditemItemModelObj;

  var controller = Get.find<CheckOutController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: getPadding(
        all: 8,
      ),
      decoration: AppDecoration.fillGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder16,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgRectangle44012,
            height: getSize(94),
            width: getSize(94),
            radius: BorderRadius.circular(
              getHorizontalSize(16),
            ),
          ),
          Padding(
            padding: getPadding(
              left: 16,
              top: 21,
              bottom: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Obx(
                  () => Text(
                    fooditemItemModelObj.foodNameTxt.value,
                    style: theme.textTheme.titleMedium,
                  ),
                ),
                Container(
                  margin: getMargin(
                    top: 9,
                  ),
                  padding: getPadding(
                    left: 8,
                    top: 2,
                    right: 8,
                    bottom: 2,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusStyle.circleBorder12,
                  ),
                  child: Obx(
                    () => Text(
                      fooditemItemModelObj.foodPriceTxt.value,
                      style: theme.textTheme.bodyLarge,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: getPadding(
              left: 26,
              top: 21,
              bottom: 8,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Obx(
                  () => Text(
                    fooditemItemModelObj.foodQuantityTxt.value,
                    style: CustomTextStyles.titleMediumPrimary16,
                  ),
                ),
                Padding(
                  padding: getPadding(
                    top: 12,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomIconButton(
                        height: getSize(32),
                        width: getSize(32),
                        padding: getPadding(
                          all: 6,
                        ),
                        child: CustomImageView(
                          svgPath: ImageConstant.imgMenu,
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          left: 10,
                          top: 5,
                          bottom: 6,
                        ),
                        child: Text(
                          "lbl_01".tr,
                          style: theme.textTheme.bodyLarge,
                        ),
                      ),
                      CustomIconButton(
                        height: getSize(32),
                        width: getSize(32),
                        margin: getMargin(
                          left: 11,
                        ),
                        padding: getPadding(
                          all: 6,
                        ),
                        child: CustomImageView(
                          svgPath: ImageConstant.imgPlus,
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
    );
  }
}
