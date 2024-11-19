import 'package:flutter/material.dart';
import 'package:diet_recipe_app/core/app_export.dart';
import 'package:diet_recipe_app/data/listdata/app_listdata.dart';
import 'package:diet_recipe_app/widgets/app_bar_text.dart';
import '../recommendations_screen/widgets/recommendations_item_widget.dart';
import 'controller/recommendations_controller.dart';

class RecommendationsScreen extends GetWidget<RecommendationsController> {
  const RecommendationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
        backgroundColor: theme.colorScheme.onPrimaryContainer,

        body: SafeArea(
          child: Column(
            children: [
              AppBarText(
                title: 'Recommendations ',
               onTap: () => Get.back(),
              ),
              Expanded(
              child: GridView.builder(
                padding: getPadding(left: 20,right: 20),

                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(

                        mainAxisExtent: getSize(227),
                        crossAxisCount: 2,
                        mainAxisSpacing: getSize(16),
                        crossAxisSpacing: getSize(16)),
                    physics: BouncingScrollPhysics(),
                    itemCount: controller.recommendationsModelObj.value
                        .recommendationsItemList.value.length,
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
    );
  }
  onTapRecommendations() {
    Get.toNamed(
      AppRoutes.homeScreenContainerScreen,
    );
  }
}
