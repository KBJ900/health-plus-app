import 'dart:io';

import 'package:flutter/material.dart';
import 'package:diet_recipe_app/core/app_export.dart';
import 'package:diet_recipe_app/presentation/home_screen_container_screen/controller/home_screen_container_controller.dart';

import '../data/pref_data/pref_data.dart';
import '../generated/assets.dart';

// ignore: must_be_immutable
class CustomBottomBar extends StatelessWidget {
  CustomBottomBar({
    Key? key,
    this.onChanged,
  }) : super(
    key: key,
  );

  RxInt selectedIndex = 0.obs;

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgNavhome,
      activeIcon: ImageConstant.imgNavhome,
      title: "lbl_home".tr,
      type: BottomBarEnum.Home,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavourmenu,
      activeIcon: ImageConstant.imgNavourmenu,
      title: "lbl_food".tr,
      type: BottomBarEnum.ourMenu,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavourmenuPrimary,
      activeIcon: ImageConstant.imgNavourmenuPrimary,
      title: "lbl_home".tr,
      type: BottomBarEnum.add,
      isCircle: true,

    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavmyplan,
      activeIcon: ImageConstant.imgNavmyplan,
      title: "lbl_record".tr,
      type: BottomBarEnum.myPlan,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavprofile,
      activeIcon: ImageConstant.imgNavprofile,
      title: "lbl_profile".tr,
      type: BottomBarEnum.Profile,
    )
  ];

  Function(BottomBarEnum)? onChanged;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenContainerController>(
      builder: (controller) {
        return Container(
          height: getSize(Platform.isIOS?130:100),
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: appTheme.black900.withOpacity(0.03),
                spreadRadius: getHorizontalSize(
                  2,
                ),
                blurRadius: getHorizontalSize(
                  2,
                ),
                offset: Offset(
                  0,
                  -1,
                ),
              ),
            ],
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            elevation: 0,

            currentIndex: PrefData.currentIndex,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomImageView(
                      svgPath: ImageConstant.imgNavhome,
                      height: getSize(
                        24,
                      ),
                      width: getSize(
                        24,
                      ),
                      color: Color(0xFF7C7C7C),
                      margin: getMargin(
                        top: 0,
                      ),
                    ),
                    SizedBox(
                      height: getSize(8),
                    ),
                    Text(
                      "Home".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: theme.textTheme.bodyMedium!.copyWith(
                        color:Color(0xFF7C7C7C),
                      ),
                    ),
                  ],
                ),
                activeIcon: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomImageView(
                        svgPath: ImageConstant.imgNavhome,
                        height: getSize(
                          24,
                        ),
                        width: getSize(
                          24,
                        ),
                        color: Color(0xFF5E9920),
                        margin: getMargin(
                          top: 0,
                        ),
                      ),
                      SizedBox(
                        height: getSize(8),
                      ),
                      Text(
                        'Home',
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: theme.textTheme.bodyMedium!.copyWith(
                          color: Color(0xFF5E9920),
                        ),
                      ),
                    ],
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomImageView(
                      svgPath: ImageConstant.imgNavourmenu,
                      height: getSize(24,),
                      width: getSize(24,),
                      color: Color(0xFF7C7C7C),
                      margin: getMargin(
                        top: 0,
                      ),
                    ),
                    SizedBox(
                      height: getSize(8),
                    ),
                    Text(
                      "Our menu".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: theme.textTheme.bodyMedium!.copyWith(
                        color:Color(0xFF7C7C7C),
                      ),
                    ),
                  ],
                ),
                activeIcon: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomImageView(
                         svgPath: ImageConstant.imgNavourmenu,
                        height: getSize(
                          24,
                        ),
                        width: getSize(
                          24,
                        ),
                        color: Color(0xFF5E9920),
                        margin: getMargin(
                          top: 0,
                        ),
                      ),
                      SizedBox(
                        height: getSize(8),
                      ),
                      Text(
                        'Our menu',
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: theme.textTheme.bodyMedium!.copyWith(
                          color: Color(0xFF5E9920),
                        ),
                      ),
                    ],
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: SizedBox(),
                label: '',


              ),
              BottomNavigationBarItem(
                icon: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomImageView(
                      svgPath: Assets.imagesImgNavmyplan,
                      height: getSize(
                        24,
                      ),
                      width: getSize(
                        24,
                      ),
                      color: Color(0xFF7C7C7C),
                      margin: getMargin(
                        top: 0,
                      ),
                    ),
                    SizedBox(
                      height: getSize(8),
                    ),
                    Text(
                      "My plan".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: theme.textTheme.bodyMedium!.copyWith(
                        color: Color(0xFF7C7C7C),
                      ),
                    ),
                  ],
                ),
                activeIcon: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomImageView(
                        svgPath: Assets.imagesImgNavmyplanPrimary,
                        height: getSize(
                          24,
                        ),
                        width: getSize(
                          24,
                        ),
                        color: Color(0xFF5E9920),
                        margin: getMargin(
                          top: 0,
                        ),
                      ),
                      SizedBox(
                        height: getSize(8),
                      ),
                      Text(
                        'My plan',
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: theme.textTheme.bodyMedium!.copyWith(
                          color: Color(0xFF5E9920),
                        ),
                      ),
                    ],
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomImageView(
                      svgPath: Assets.imagesImgNavprofile,
                      height: getSize(
                        24,
                      ),
                      width: getSize(
                        24,
                      ),
                      color: Color(0xFF7C7C7C),
                      margin: getMargin(
                        top: 0,
                      ),
                    ),
                    SizedBox(
                      height: getSize(8),
                    ),
                    Text(
                      "Profile".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: theme.textTheme.bodyMedium!.copyWith(
                        color:Color(0xFF7C7C7C),
                      ),
                    ),
                  ],
                ),
                activeIcon: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomImageView(
                        svgPath: Assets.imagesImgNavprofilePrimary,
                        height: getSize(
                          24,
                        ),
                        width: getSize(
                          24,
                        ),
                        color: Color(0xFF5E9920),
                        margin: getMargin(
                          top: 0,
                        ),
                      ),
                      SizedBox(
                        height: getSize(8),
                      ),
                      Text(
                        'Profile',
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: theme.textTheme.bodyMedium!.copyWith(
                          color: Color(0xFF5E9920),
                        ),
                      ),
                    ],
                  ),
                ),
                label: '',
              ),

            ],
            onTap: (index) {
              PrefData.currentIndex = index;
              controller.update();
              // onChanged?.call(bottomMenuList[index].type);
              controller.update();
            },
          ),
        );
      },
      init: HomeScreenContainerController(),
    );
  }
}

enum BottomBarEnum {
  Home,
  ourMenu,
  add,
  myPlan,
  Profile,
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    this.title,
    required this.type,
    this.isCircle = false,
  });

  String icon;

  String activeIcon;

  String? title;

  BottomBarEnum type;

  bool isCircle;
}

class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: getFontSize(18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
