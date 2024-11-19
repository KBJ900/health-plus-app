import 'package:flutter/material.dart';
import 'package:diet_recipe_app/core/app_export.dart';
import 'package:diet_recipe_app/presentation/details_screen/widget/food_details.dart';
import 'package:diet_recipe_app/presentation/details_screen/widget/food_item.dart';
import 'package:diet_recipe_app/widgets/custom_elevated_button.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'controller/details_controller.dart';

class DetailsScreen extends GetWidget<DetailsController> {
  const DetailsScreen({Key? key}) : super(key: key);

  @override Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);


    return Scaffold(
      backgroundColor: theme.colorScheme.onPrimaryContainer,

      body: Stack(
        children: [
          Container(
            height: getSize(320),
            width: double.infinity,

            child: Stack(
              fit: StackFit.passthrough,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgDOM,
                  fit: BoxFit.fill,
                ),
                SafeArea(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: getPadding(top: 10, left: 20),
                        child: GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            height: getSize(48),
                            width: getSize(48),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0x4D000000),
                            ),
                            child: CustomImageView(
                                svgPath: ImageConstant.imgArrowleft,
                                color: AppColor.white,
                                height: getSize(24),
                                width: getSize(24),

                                ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: getPadding(top: 10, right: 20),
                        child: GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            height: getSize(48),
                            width: getSize(48),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0x4D000000),
                            ),
                            child: Padding(
                              padding: getPadding(left: 9),
                              child: CustomImageView(
                                  svgPath: ImageConstant.imgCart,
                                  color: AppColor.white,
                                  height: getSize(24),
                                  width: getSize(24),
                                  alignment: Alignment.centerLeft,
                                  onTap: () {
                                    Get.back();
                                  }),
                            ),
                          ),
                        ),
                      ),


                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: getPadding(top: 295),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(getHorizontalSize(24)),
                      topLeft: Radius.circular(getHorizontalSize(24)))
              ),
              child: ListView(
                padding: EdgeInsets.only(left: 20, right: 20, top: 24),
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text('Fresh green salad', style: TextStyle(
                          color: AppColor.black,
                          fontWeight: FontWeight.w700,
                          fontSize: getSize(22),
                        ),),
                      ),
                      Text('\$12.00', style: TextStyle(
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.w700,
                        fontSize: getSize(18),
                      ),),
                    ],
                  ),
                  Padding(
                    padding: getPadding(top: 10, bottom: 24),
                    child: Text(
                        "msg_it_is_a_long_established".tr,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: CustomTextStyles
                            .bodyLargeOnError_1.copyWith(
                            height: 1.56)),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment
                          .spaceBetween, children: [
                        CircularPercentIndicator(
                      radius: getSize(65),
                      lineWidth: getSize(11),

                      circularStrokeCap: CircularStrokeCap.round,
                      percent: 0.50,
                      reverse: false,
                      center: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Kcal',style: TextStyle(
                            color: AppColor.grey400,
                            fontSize: getFontSize(16),
                            fontWeight: FontWeight.w400,
                          ),),
                          Text('880',style: TextStyle(
                            color: AppColor.primaryColor,
                            fontSize: getFontSize(18),
                            fontWeight: FontWeight.w700,
                          ),),
                        ],
                      ),
                      progressColor: Color(0xFF5E9920),
                      backgroundColor: AppColor.grey200,
                    ),
                        FoodDetailsChart(),
                    ]
                  ),
                  Padding (padding: getPadding(top: 26,bottom: 16),
                      child: Text("lbl_24_00".tr,
                          style: theme.textTheme.titleMedium)),
                  Padding(
                    padding: getPadding(bottom: 24),
                    child: FoodItemCount(),
                  ),
                  Padding(
                    padding: getPadding(bottom: 16),
                    child: Text('Tags',style: TextStyle(
                      fontSize: getFontSize(18),
                      fontWeight: FontWeight.w700,
                      color: AppColor.black,
                    ),),
                  ),
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColor.grey100,
                          borderRadius: BorderRadius.circular(getHorizontalSize(16)),
                        ),
                        child: Padding(
                          padding: getPadding(top: 7,bottom: 7,left: 24,right: 24),
                          child: Text('Sandwiches',style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: getFontSize(16),
                          ),),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
         Align(
             alignment: Alignment.bottomCenter,
             child: CustomElevatedButton(
               margin: getMargin(left: 20,right: 20,bottom: 40),
                 text: 'Go to my cart',
               onTap: () {
                 onTapGotomycart();
               },
             ))

        ],
      ),
    );
  }


  onTapArrowleftone() {
    Get.back();
  }

  onTapCartone() {
    Get.toNamed(AppRoutes.myCartScreen,);
  }

  onTapGotomycart() {
    Get.toNamed(AppRoutes.myCartScreen,);
  }
}


