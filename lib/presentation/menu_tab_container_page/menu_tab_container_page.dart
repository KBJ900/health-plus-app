import 'package:flutter/material.dart';
import 'package:diet_recipe_app/core/app_export.dart';
import 'package:diet_recipe_app/presentation/menu_page/menu_page.dart';

import 'controller/menu_tab_container_controller.dart';
import 'models/menu_tab_container_model.dart';

// ignore: must_be_immutable
class MenuTabContainerPage extends StatelessWidget {
  MenuTabContainerPage({Key? key})
      : super(
          key: key,
        );

  MenuTabContainerController controller =
      Get.put(MenuTabContainerController(MenuTabContainerModel().obs));

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.onPrimaryContainer,
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: getPadding(
                  left: 20,
                  top: 21,
                ),
                child: Text(
                  "lbl_our_menu".tr,
                  style: theme.textTheme.headlineMedium,
                ),
              ),
              Container(
                height: getVerticalSize(35),
                width: getHorizontalSize(388),
                margin: getMargin(
                  top: 39,
                ),
                child: TabBar(
                  controller: controller.tabviewController,
                  isScrollable: true,
                  labelColor: theme.colorScheme.primary,
                  labelStyle: TextStyle(
                    fontSize: getFontSize(16),
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w600,
                  ),
                  unselectedLabelColor: theme.colorScheme.onError,
                  unselectedLabelStyle: TextStyle(
                    fontSize: getFontSize(16),
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w400,
                  ),
                  indicatorColor: theme.colorScheme.primary,
                  tabs: [
                    Tab(
                      child: Text(
                        "lbl_main_course".tr,
                      ),
                    ),
                    Tab(
                      child: Text(
                        "lbl_break_fast".tr,
                      ),
                    ),
                    Tab(
                      child: Text(
                        "lbl_salad".tr,
                      ),
                    ),
                    Tab(
                      child: Text(
                        "lbl_snack".tr,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: getVerticalSize(654),
                child: TabBarView(
                  controller: controller.tabviewController,
                  children: [
                    MenuPage(),
                    MenuPage(),
                    MenuPage(),
                    MenuPage(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
