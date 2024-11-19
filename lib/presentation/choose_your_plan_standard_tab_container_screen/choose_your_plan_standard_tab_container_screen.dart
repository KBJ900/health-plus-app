import 'controller/choose_your_plan_standard_tab_container_controller.dart';
import 'package:flutter/material.dart';
import 'package:diet_recipe_app/core/app_export.dart';
import 'package:diet_recipe_app/presentation/choose_your_plan_customized_page/choose_your_plan_customized_page.dart';
import 'package:diet_recipe_app/presentation/choose_your_plan_standard_one_page/choose_your_plan_standard_one_page.dart';

// ignore_for_file: must_be_immutable
class ChooseYourPlanStandardTabContainerScreen
    extends GetWidget<ChooseYourPlanStandardTabContainerController> {
  const ChooseYourPlanStandardTabContainerScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.onPrimaryContainer,
      body: GetBuilder<ChooseYourPlanStandardTabContainerController>(
        init: ChooseYourPlanStandardTabContainerController(),
        builder: (controller) =>  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: getPadding(
                left: 20,
                bottom: 16,
                top: 16,
              ),
              child: Text(
                "msg_choose_your_plan".tr,
                style: theme.textTheme.headlineMedium,
              ),
            ),

            Stack(
              fit: StackFit.passthrough,
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Container(
                  margin: getMargin(left: 20,right: 20,),
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
                    indicatorSize: TabBarIndicatorSize.tab,
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
                        child:Text("Standard".tr,),
                      ) ,
                      Tab(child: Text("Customized".tr)),

                    ]
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: controller.tabviewController,
                children: [
                  ChooseYourPlanStandardOnePage(),
                  ChooseYourPlanCustomizedPage(),
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }

  ///Handling route based on bottom click actions

}
