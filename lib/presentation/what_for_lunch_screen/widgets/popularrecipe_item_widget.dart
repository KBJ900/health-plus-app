import '../controller/what_for_lunch_controller.dart';
import '../models/popularrecipe_item_model.dart';
import 'package:flutter/material.dart';
import 'package:diet_recipe_app/core/app_export.dart';

// ignore: must_be_immutable
class LunchItem extends StatelessWidget {

  final String? img;
  final String? name;
  final String? time;
  final String? kcal;

  LunchItem(
    this.popularrecipeItemModelObj, {
    Key? key, this.img, this.time, this.kcal, this.name,
  }) : super(
          key: key,
        );

  PopularrecipeItemModel popularrecipeItemModelObj;

  var controller = Get.find<WhatForLunchController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: getPadding(
        all: 8,
      ),
      decoration: AppDecoration.fillGray
          .copyWith(
          borderRadius:
          BorderRadiusStyle
              .roundedBorder16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            clipBehavior: Clip.antiAlias,

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(getHorizontalSize(16)),
            ),
            child: CustomImageView(
              imagePath: img??ImageConstant.imgRectangle728,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: getPadding(
              top: 8,
              bottom: 8,
            ),
            child:Text(name??
                popularrecipeItemModelObj.pencagebluesTxt.value,
                style: theme.textTheme.titleMedium,
              ),

          ),
          Padding(
            padding: getPadding(

            ),
            child: Row(
              children: [
                CustomImageView(
                  svgPath: ImageConstant.imgClock,
                  height: getSize(20),
                  width: getSize(20),
                ),
                Padding(
                  padding: getPadding(
                    left: 4,
                  ),
                  child: Text(time??
                      popularrecipeItemModelObj.timeTextTxt.value,
                      style: CustomTextStyles.bodyLargeOnError_1,
                    ),

                ),
                CustomImageView(
                  svgPath: ImageConstant.imgIcfire,
                  height: getSize(20),
                  width: getSize(20),
                  margin: getMargin(
                    left: 8,
                  ),
                ),
                Padding(
                  padding: getPadding(
                    left: 4,
                  ),
                  child:  Text(kcal??
                      popularrecipeItemModelObj.calorieTextTxt.value,
                      style: CustomTextStyles.bodyLargeOnError_1,
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
