import 'package:flutter/material.dart';
import 'package:diet_recipe_app/core/app_export.dart';
import 'package:diet_recipe_app/data/listdata/app_listdata.dart';

import '../my_plan_page/widgets/myplan_item_widget.dart';
import 'controller/my_plan_controller.dart';
import 'models/my_plan_model.dart';

// ignore: must_be_immutable
class MyPlanPage extends StatelessWidget {
  MyPlanPage({Key? key}) : super(key: key);

  MyPlanController controller = Get.put(MyPlanController(MyPlanModel().obs));

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
        backgroundColor: theme.colorScheme.onPrimaryContainer,
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              Padding(
                padding: getPadding(top: 29,left: 20),
                child: Text("lbl_my_plan".tr,
                    style: theme.textTheme.headlineMedium),
              ),
              ListView.builder(
                padding: getPadding(top: 16),
                shrinkWrap: true,
                itemCount: AppListData.myPlanList.length,
                itemBuilder: (context, index) {
                return MyPlanItemWidget(
                  onTapMyplan: () {
                    onTapMyplan();
                  },
                  planName: AppListData.myPlanList[index].name,
                  date: AppListData.myPlanList[index].date,
                  isPending: AppListData.myPlanList[index].isPending!,
                );
              },)

            ],
        ),
    );
  }


  onTapMyplan() {
    Get.toNamed(
      AppRoutes.runningPlanDetailsScreen,
    );
  }
}
