import 'package:flutter/material.dart';
import 'package:diet_recipe_app/core/app_export.dart';
import 'package:diet_recipe_app/data/listdata/app_listdata.dart';
import 'package:diet_recipe_app/data/pref_data/pref_data.dart';
import 'package:diet_recipe_app/presentation/home_screen_page/widget/healthy_food_menu_banner.dart';
import 'package:diet_recipe_app/presentation/home_screen_page/widget/home_option.dart';
import 'package:diet_recipe_app/presentation/home_screen_page/widget/running_card.dart';
import 'package:diet_recipe_app/presentation/home_screen_page/widget/what_lunch_container.dart';
import 'package:diet_recipe_app/presentation/recommendations_screen/controller/recommendations_controller.dart';
import '../recommendations_screen/widgets/recommendations_item_widget.dart';
import 'controller/home_screen_controller.dart';
import 'models/home_screen_model.dart';

// ignore_for_file: must_be_immutable
class HomeScreenPage extends StatelessWidget {
  HomeScreenPage({Key? key}) : super(key: key);

  HomeScreenController controller =
      Get.put(HomeScreenController(HomeScreenModel().obs));

  RecommendationsController recommendationsController =Get.put(RecommendationsController());

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
        backgroundColor: theme.colorScheme.onPrimaryContainer,

        body: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: getPadding(left: 20,right: 20,top: 16,bottom: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Welcome',style: TextStyle(
                            color: AppColor.black,
                            fontSize: getFontSize(28),
                            fontWeight: FontWeight.w700
                          ),),
                          Text('john abram',style: TextStyle(
                            color: AppColor.grey400,
                            fontSize: getFontSize(16),
                            fontWeight: FontWeight.w400
                          ),),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        onTapIcnotification();
                      },
                      child: Padding(
                        padding:getPadding(right: 16),
                        child: CustomImageView(
                          svgPath: ImageConstant.imgIcnotification,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.premiumScreen);
                      },
                      child: CustomImageView(
                        svgPath: ImageConstant.imgPremiumquality3,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                 physics: BouncingScrollPhysics(),
                 // shrinkWrap: true,
                 children: [
                   RunningCard(),
                   HomeOption(),
                   Padding(
                      padding: getPadding(left: 20, right: 20),
                      child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                           Text("lbl_what_for_lunch".tr,
                               style: theme.textTheme.titleLarge),
                           GestureDetector(
                               onTap: () {
                                onTapTxtViewall();
                               },
                               child: Padding(
                                   padding: getPadding(
                                       top: 3, bottom: 3),
                                   child: Text("lbl_view_all".tr,
                                       style: CustomTextStyles
                                           .bodyLargeOnError_1)))
                          ])),
                   /// What for lunch
                   Container(
                     margin: getMargin(top: 16,bottom: 24),
                     height: getSize(233),

                     child: ListView.builder(
                       physics: BouncingScrollPhysics(),
                       shrinkWrap: true,
                     
                       scrollDirection: Axis.horizontal,
                       itemCount: 3,

                       itemBuilder: (context, index) {
                         return  Padding(
                           padding: getPadding(left: 16),
                           child: GestureDetector(
                             onTap: () {
                               Get.toNamed(AppRoutes.detailsScreen);
                             },
                             child: WhatLunchContainer(
                               name: AppListData.lunchList[index].name,
                               img: AppListData.lunchList[index].img,
                               time: AppListData.lunchList[index].time,
                               kcal: AppListData.lunchList[index].kcal,
                             ),
                           )
                         );
                       },
                     ),
                   ),

                   GestureDetector(
                     onTap: () {
                       PrefData.currentIndex=1;
                       controller.update();

                     },
                       child: HealthyFoodMenuBanner()),

                   Padding(
                      padding: getPadding(top: 29, right: 20,left: 20),
                      child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                           Expanded(
                             child: Text("msg_recommendations".tr,
                                 style: theme.textTheme.titleLarge),
                           ),
                           GestureDetector(
                               onTap: () {
                                onTapTxtViewallone();
                               },
                               child: Padding(
                                   padding: getPadding(bottom: 5),
                                   child: Text("lbl_view_all".tr,
                                       style: CustomTextStyles
                                           .bodyLargeOnError_1)))
                          ]
                      )
                   ),

                   Container(
                     margin: getMargin(top: 16),
                     // height: getSize(230),
                     height: getSize(235),
                     child: GridView.builder(
                         padding: getPadding(left: 20,right: 20),
                         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                             mainAxisExtent: getSize(227),
                             crossAxisCount: 2,
                             mainAxisSpacing: getSize(16),
                             crossAxisSpacing: getSize(16)),
                         physics: BouncingScrollPhysics(),
                         itemCount: 2,
                         itemBuilder: (context, index) {
                           return RecommendationsItemWidget(
                             img: AppListData.recommendationsList[index].img,
                             text: AppListData.recommendationsList[index].name,
                             color: AppListData.recommendationsList[index].backColor,

                           );
                         }
                     ),
                   ),
                 ],
                ),
              )
            ]
        )
    );
  }

  onTapIcnotification() {
    Get.toNamed(
      AppRoutes.notificationsScreen,
    );
  }

  onTapColumncalendar() {
    Get.toNamed(
      AppRoutes.moveDaysScreen,
    );
  }

  onTapColumnplusone() {
    Get.toNamed(
      AppRoutes.addMenuTabContainerScreen,
    );
  }

  onTapColumnsignal() {
    Get.toNamed(
      AppRoutes.changeDeliveryAddressScreen,
    );
  }

  onTapTxtViewall() {
    Get.toNamed(
      AppRoutes.whatForLunchScreen,
    );
  }

  onTapTxtViewallone() {
    Get.toNamed(
      AppRoutes.recommendationsScreen,
    );
  }
}
