import 'package:diet_recipe_app/data/pref_data/pref_data.dart';
import 'package:diet_recipe_app/presentation/choose_your_plan_standard_one_page/widget/selected_data.dart';
import '../choose_your_plan_standard_tab_container_screen/widget/plan_container.dart';
import 'controller/choose_your_plan_standard_one_controller.dart';
import 'package:flutter/material.dart';
import 'package:diet_recipe_app/core/app_export.dart';
import 'package:diet_recipe_app/widgets/custom_elevated_button.dart';

// ignore: must_be_immutable
class ChooseYourPlanStandardOnePage extends StatelessWidget {
  ChooseYourPlanStandardOnePage({Key? key})
      : super(
          key: key,
        );

  ChooseYourPlanStandardOneController controller = Get.put(
      ChooseYourPlanStandardOneController());

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.onPrimaryContainer,
      body: ListView(
        physics: BouncingScrollPhysics(),
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: getPadding(
              left: 20,
              top: 24,
              right: 20,
            ),
            child: GetBuilder<ChooseYourPlanStandardOneController>(builder: (controller) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Expanded(
                        child: PlanContainer(
                          img: ImageConstant.imgMap,
                          planName: 'Premium plan',
                        ),
                      ),
                      SizedBox(
                        width: getSize(20),
                      ),
                      Expanded(
                        child: PlanContainer(
                          img: ImageConstant.imgMail,
                          planName: 'Basic plan',
                          backColor: Color(0xFFDDEFE9),
                        ),
                      ),
                      SizedBox(
                        width: getSize(20),
                      ),
                      Expanded(
                        child: PlanContainer(
                          img: ImageConstant.imgGroup38133,
                          planName: 'Weekley plan',
                          backColor: Color(0xFFDAF3F8),
                        ),
                      ),
                    ],
                  ),

                  SelectedData(),


                  CustomElevatedButton(
                    onTap: () {
                      PrefData.currentIndex = 3;

                      controller.update();
                    },
                    text: "lbl_continue".tr,
                    margin: getMargin(
                      top: 32,
                      bottom: 40
                    ),
                  ),
                ],
              );
            },init: ChooseYourPlanStandardOneController(),)
          ),
        ],
      ),
    );
  }
}
