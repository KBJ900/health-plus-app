// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:diet_recipe_app/core/app_export.dart';
import 'package:diet_recipe_app/presentation/home_screen_page/home_screen_page.dart';
import 'package:diet_recipe_app/presentation/menu_page/menu_page.dart';
import 'package:diet_recipe_app/presentation/menu_tab_container_page/menu_tab_container_page.dart';
import 'package:diet_recipe_app/presentation/my_plan_page/my_plan_page.dart';
import 'package:diet_recipe_app/presentation/profile_page/profile_page.dart';
import 'package:diet_recipe_app/widgets/custom_bottom_app_bar.dart';
import '../../data/pref_data/pref_data.dart';
import '../../generated/assets.dart';
import '../choose_your_plan_standard_tab_container_screen/choose_your_plan_standard_tab_container_screen.dart';
import 'controller/home_screen_container_controller.dart';

// ignore: must_be_immutable
class HomeScreenContainerScreen
    extends GetWidget<HomeScreenContainerController> {
   HomeScreenContainerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return GetBuilder<HomeScreenContainerController>(builder: (controller) {
      return WillPopScope(
        onWillPop: () {

          if (PrefData.currentIndex == 0) {
            {
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  backgroundColor: Colors.white,
                  shape:  RoundedRectangleBorder(borderRadius:
                  BorderRadius.all(Radius.circular(getHorizontalSize(16)))),
                  insetPadding: getPadding(left:16,right: 16),
                  title: Padding(
                    padding: getPadding(left: 15,right: 15),
                    child: Text('Are you sure you want to Exit ?',style: TextStyle(
                      color: Colors.black,
                      fontSize: getFontSize(22),
                      fontWeight: FontWeight.w600,
                    ),textAlign: TextAlign.center),
                  ),

                  actions: <Widget>[
                    Padding(
                      padding: getPadding(bottom: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Padding(
                                padding: getPadding(left: getSize(15)),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color:  AppColor.main,
                                        width: getSize(1.5),
                                      )
                                  ),
                                  child: Padding(
                                    padding:  getPadding(top: getSize(14),bottom: getSize(14)),
                                    child: Center(
                                      child: Text(
                                        'No',style: TextStyle(
                                        color:  AppColor.main,
                                        fontSize: getFontSize(18),
                                        fontWeight: FontWeight.w700,
                                      ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: getSize(20),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: ()  {
                                PrefData.currentIndex =0;
                                Get.back();
                                controller.onExit();
                              },
                              child: Padding(
                                padding: getPadding(right: getSize(15)),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: AppColor.main,
                                  ),
                                  child: Padding(
                                    padding:  getPadding(top: getSize(14),bottom: getSize(14)),
                                    child: Center(
                                      child: Text(
                                        'Yes',style: TextStyle(
                                        color: Colors.white,
                                        fontSize: getFontSize(18),
                                        fontWeight: FontWeight.w700,
                                      ),

                                        textAlign: TextAlign.center,

                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
              controller.update();
            }
          }
          else {
            PrefData.currentIndex = 0;
            controller.update();
          }
          return Future(() => false);
        },
        child: Scaffold(
            backgroundColor: AppColor.white,
            floatingActionButton: Padding(
              padding:getPadding(top: Platform.isIOS?5:35),
              child: GestureDetector(
                onTap: () {
                  PrefData.currentIndex = 2;
                      controller.update();
                },
                child: Container(
                  height: getSize(64),
                  width: getSize(64),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xFF5E9920),
                    shape: BoxShape.circle,
                  ),
                  child: CustomImageView(
                    svgPath: Assets.imagesImgIcadd,
                  ),
                ),
              ),
              // FloatingActionButton(
              //   backgroundColor: Color(0xFF5E9920),
              //   splashColor: Colors.transparent,
              //   onPressed: () {
              //     PrefData.currentIndex = 2;
              //     controller.update();
              //     // Get.toNamed(AppRoutes.chooseYourPlanStandardTabContainerScreen);
              //   },
              //
              //
              // ),
            ),
           floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            body: SafeArea(
              child: Center(
                child: pageList.elementAt(PrefData.currentIndex),
              ),
            ),
            bottomNavigationBar:
            CustomBottomBar(onChanged: (BottomBarEnum type) {
              Get.toNamed(getCurrentRoute(type), id: 1);
            }
            )
        ),
      );
    },init: HomeScreenContainerController(),);
  }

  ///Handling route based on bottom click actions
   String getCurrentRoute(BottomBarEnum type) {
     switch (type) {
       case BottomBarEnum.Home:
         return AppRoutes.homeScreenPage;
       case BottomBarEnum.ourMenu:
         return AppRoutes.menuPage;
       case BottomBarEnum.add:
         return AppRoutes.chooseYourPlanStandardTabContainerScreen;
       case BottomBarEnum.myPlan:
         return AppRoutes.myPlanPage;
       case BottomBarEnum.Profile:
         return AppRoutes.profilePage;
       default:
         return "/";
     }
   }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.homeScreenPage:
        return HomeScreenPage();
      case AppRoutes.menuTabContainerPage:
        return MenuTabContainerPage();
      case AppRoutes.chooseYourPlanStandardTabContainerScreen:
        return ChooseYourPlanStandardTabContainerScreen();
      case AppRoutes.myPlanPage:
        return MyPlanPage();
      case AppRoutes.profilePage:
        return ProfilePage();
      default:
        return DefaultWidget();
    }
  }
  List<Widget> pageList =[
    HomeScreenPage(),
    MenuPage(),
    ChooseYourPlanStandardTabContainerScreen(),
    MyPlanPage(),
    ProfilePage(),

  ];
}
