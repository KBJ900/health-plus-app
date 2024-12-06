import 'package:flutter/material.dart' hide MenuController;
import 'package:diet_recipe_app/core/app_export.dart';
import 'package:diet_recipe_app/presentation/menu_page/widgets/ourmenu_list.dart';
import 'controller/menu_controller.dart';
import 'models/menu_model.dart';

// ignore_for_file: must_be_immutable
class MenuPage extends StatelessWidget {
  MenuPage({Key? key}) : super(key: key);

  MenuPageController controller = Get.put(MenuPageController(MenuModel().obs));

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
        backgroundColor: theme.colorScheme.onPrimaryContainer,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding:getPadding(top: 16,left: 20),
                  child: Text('Our menu',style: TextStyle(
                    color: AppColor.black,
                    fontSize: getFontSize(28),
                    fontWeight: FontWeight.w700,
                  ),),
                ),
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
                            child:Text("lbl_main_course".tr,),

                          ) ,
                          Tab(child: Text("lbl_break_fast".tr)),
                          Tab(child: Text("lbl_salad".tr)),
                          Tab(child: Text("lbl_snack".tr))
                        ]
                    ),
                  ],
                ),
                // Padding(
                //   padding:getPadding(left: 20,top: 20),
                //   child: Text("msg_60_lunch_dinner".tr, style: theme.textTheme.bodyLarge),
                // ),
                // Expanded(
                // child: Padding(
                //     padding: getPadding(top: 18),
                //     child: ListView.separated(
                //         physics: BouncingScrollPhysics(),
                //         shrinkWrap: true,
                //         separatorBuilder: (context, index) {
                //           return SizedBox(height: getSize(16));
                //         },
                //         itemCount: AppListData.ourMenu.length,
                //         itemBuilder: (context, index) {
                //           OurMenuItemModel model = AppListData.ourMenu[index];
                //              return OurMenuItemWidget(
                //                model,
                //                img: AppListData.ourMenu[index].img,
                //                protein: AppListData.ourMenu[index].protein,
                //                fat: AppListData.ourMenu[index].fat,
                //                curb: AppListData.ourMenu[index].carb,
                //                categories: AppListData.ourMenu[index].categories,
                //                onTapOurmenu: () {
                //                 onTapOurmenu();
                //                 },
                //
                //             );
                //           }
                //         ),
                //   ),
                // ),
                Expanded(
                  child: TabBarView(

                    controller: controller.tabviewController,
                      children: [
                    OurMenuList(),
                    OurMenuList(),
                    OurMenuList(),
                    OurMenuList(),
                  ]),
                )

          ]
          ),
        )
    );
  }

  onTapOurmenu() {
    Get.toNamed(
      AppRoutes.detailsScreen,
    );
  }
}
