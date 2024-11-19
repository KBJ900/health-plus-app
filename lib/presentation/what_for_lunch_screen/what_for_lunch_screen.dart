

import 'package:flutter/material.dart';
import 'package:diet_recipe_app/core/app_export.dart';
import 'package:diet_recipe_app/data/listdata/app_listdata.dart';
import 'package:diet_recipe_app/widgets/app_bar_text.dart';

import '../what_for_lunch_screen/widgets/popularrecipe_item_widget.dart';
import 'controller/what_for_lunch_controller.dart';
import 'models/popularrecipe_item_model.dart';

class WhatForLunchScreen extends GetWidget<WhatForLunchController> {
  const WhatForLunchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
        backgroundColor: theme.colorScheme.onPrimaryContainer,

        body: SafeArea(
          child: Column(
            children: [
             AppBarText(
              onTap: () {
                Get.back();
              },
              title: 'What for lunch',
             ),
              Expanded(
                child: GridView.builder(
                 primary: true,
                    padding: getPadding(left: 20,right: 20,top: 10),
                 

                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: getSize(240),
                        crossAxisCount: 2,
                        mainAxisSpacing: getSize(16),
                        crossAxisSpacing: getSize(16)),
                    physics: BouncingScrollPhysics(),
                    itemCount: AppListData.lunchList.length,
                    itemBuilder: (context, index) {
                      PopularrecipeItemModel model = controller
                          .whatForLunchModelObj
                          .value
                          .popularrecipeItemList
                          .value[index];
                      return LunchItem(model,
                        img: AppListData.lunchList[index].img,
                        name: AppListData.lunchList[index].name,
                        time: AppListData.lunchList[index].time,
                        kcal: AppListData.lunchList[index].kcal,
                      );
                    }
                    ),
              ),
            ],
          ),
        ));
  }

  onTapWhatforlunch() {
    Get.toNamed(
      AppRoutes.homeScreenContainerScreen,
    );
  }
}
