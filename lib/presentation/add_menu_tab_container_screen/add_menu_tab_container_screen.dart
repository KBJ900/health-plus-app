import 'package:flutter/material.dart';
import 'package:diet_recipe_app/core/app_export.dart';
import 'package:diet_recipe_app/presentation/add_menu_page/add_menu_page.dart';
import 'package:diet_recipe_app/widgets/app_bar_text.dart';
import 'controller/add_menu_tab_container_controller.dart';

class AddMenuTabContainerScreen
    extends GetWidget<AddMenuTabContainerController> {
  const AddMenuTabContainerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
        backgroundColor: theme.colorScheme.onPrimaryContainer,

        body: SafeArea(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AppBarText(
                  onTap: () => Get.back(),
                  title: 'Add menu',
                ),

                Padding(
                    padding: getPadding(left: 20, top: 16, right: 20),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                                padding: getPadding(left: 17,right: 17,top: 16,bottom: 16),
                                decoration: AppDecoration.fillGray.copyWith(
                                    borderRadius:
                                        BorderRadiusStyle.roundedBorder16),
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: [
                                      Text("lbl_sun".tr,
                                          style:
                                              theme.textTheme.titleMedium),
                                      Padding(
                                          padding: getPadding(top: 10),
                                          child: Text("lbl_18_april".tr,
                                              style: CustomTextStyles
                                                  .bodyLargeOnError_1))
                                    ])),
                          ),
                          SizedBox(
                            width: getSize(16),
                          ),
                         
                          Expanded(
                            child: Container(
                              child: Stack(
                                fit: StackFit.passthrough,
                                clipBehavior: Clip.none,
                                alignment: Alignment.topRight,
                                children: [
                                  Container(
                                      padding: getPadding(left: 17,right: 17,top: 16,bottom: 16),
                                      decoration: AppDecoration.fillGray.copyWith(
                                          borderRadius:
                                          BorderRadiusStyle.roundedBorder16),
                                      child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Text("lbl_mon".tr,
                                                style:
                                                theme.textTheme.titleMedium),
                                            Padding(
                                                padding: getPadding(top: 10),
                                                child: Text("lbl_19_april".tr,
                                                    style: CustomTextStyles
                                                        .bodyLargeOnError_1))
                                          ])),
                                                         Positioned(
                                    right: -5,
                                    top: -5,

                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: AppColor.primaryColor,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Padding(
                                        padding: getPadding(all: 4),
                                        child: CustomImageView(
                                          svgPath: ImageConstant.imgLock,height: getSize(18),),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: getSize(16),
                          ),
                          Expanded(
                            child: Container(

                                padding: getPadding(
                                    left: 16,
                                    top: 17,
                                    right: 16,
                                    bottom: 17),
                                decoration: AppDecoration.fillGray.copyWith(
                                    borderRadius:
                                        BorderRadiusStyle.roundedBorder16),
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: [
                                      Text("lbl_tue".tr,
                                          style:
                                              theme.textTheme.titleMedium),
                                      Padding(
                                          padding: getPadding(top: 10),
                                          child: Text("lbl_20_april".tr,
                                              style: CustomTextStyles
                                                  .bodyLargeOnError_1))
                                    ])),
                          ),
                          SizedBox(
                            width: getSize(16),
                          ),
                          Expanded(
                            child: Container(

                                padding: getPadding(all: 17),
                                decoration: AppDecoration.fillGray.copyWith(
                                    borderRadius:
                                        BorderRadiusStyle.roundedBorder16),
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: [
                                      Text("lbl_wed".tr,
                                          style:
                                              theme.textTheme.titleMedium),
                                      Padding(
                                          padding: getPadding(top: 10),
                                          child: Text("lbl_21_april".tr,
                                              style: CustomTextStyles
                                                  .bodyLargeOnError_1))
                                    ])),
                          )
                        ])),
                Padding(
                    padding: getPadding(left: 20, top: 24, right: 20,bottom: 8),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomImageView(
                              svgPath: ImageConstant.imgArrowleftBlack900,
                              height: getSize(20),
                              width: getSize(20),
                              margin: getMargin(bottom: 3)),
                          Text("lbl_april_2020".tr,
                              style: CustomTextStyles.titleLargeSemiBold),
                          CustomImageView(
                              svgPath:
                                  ImageConstant.imgArrowrightBlack900,
                              height: getSize(20),
                              width: getSize(20),
                              margin: getMargin(bottom: 3))
                        ])),
                Stack(
                  fit: StackFit.passthrough,
                  alignment: Alignment.bottomCenter,
                  children: <Widget>[
                    Container(
                      margin: getMargin(left: 20,right: 20),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: AppColor.grey200, width: getSize(2.5)),
                        ),
                      ),
                    ),
                    TabBar(
                      padding: getPadding(left: 20,right: 20),
                      // isScrollable: true,
                        // dividerColor: AppColor.primaryColor,
                        indicatorColor: AppColor.primaryColor,


                        labelStyle: TextStyle(
                          color: AppColor.primaryColor,
                          fontSize: getFontSize(16),
                          fontWeight: FontWeight.w600,
                        ),
                        indicatorSize: TabBarIndicatorSize.label,
                        labelPadding: EdgeInsets.zero,
                        indicatorPadding: EdgeInsets.zero,
                        unselectedLabelColor: AppColor.grey400,
                        unselectedLabelStyle: TextStyle(
                          color: AppColor.grey400,
                          fontWeight: FontWeight.w400,
                          fontSize: getFontSize(16)
                        ),

                        controller: controller.tabviewController,
                            // isScrollable: true,
                            labelColor: theme.colorScheme.primary,

                      tabs: [
                        Tab(
                          child:Text("lbl_main_course".tr,),

                        ) ,
                        Tab(child: Text("lbl_break_fast".tr)),
                        Tab(child: Text("lbl_salad".tr)),
                        Tab(child: Text("lbl_snack".tr))
                      ]
                    ),
                  ],
                ),
                Expanded(
                    child: TabBarView(
                        controller: controller.tabviewController,
                        children: [
                          AddMenuPage(),
                          AddMenuPage(),
                          AddMenuPage(),
                          AddMenuPage()
                        ]))
              ]),
        ));
  }

  onTapAddmenu() {
    Get.toNamed(
      AppRoutes.homeScreenContainerScreen,
    );
  }
}
