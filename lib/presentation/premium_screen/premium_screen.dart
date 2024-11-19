import 'package:flutter/material.dart';
import 'package:diet_recipe_app/core/app_export.dart';
import 'package:diet_recipe_app/data/listdata/app_listdata.dart';
import 'package:diet_recipe_app/widgets/app_bar_text.dart';
import 'package:diet_recipe_app/widgets/custom_elevated_button.dart';
import '../premium_screen/widgets/subscriptionpla_item_widget.dart';
import 'controller/premium_controller.dart';

class PremiumScreen extends GetWidget<PremiumController> {
  const PremiumScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
        backgroundColor: theme.colorScheme.onPrimaryContainer,

        body: SafeArea(
          child: Column(
            children: [
             AppBarText(
              title: 'Premium',
              onTap: () => Get.back(),
             ),
              ListView.separated(
                padding: getPadding(top: 16),

                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return SizedBox(height: getVerticalSize(16));
                  },
                  itemCount: AppListData.premiumPlanList.length,
                  itemBuilder: (context, index) {

                    return GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: SubscriptionPlaItemWidget(
                        title: AppListData.premiumPlanList[index].title,
                        disc: AppListData.premiumPlanList[index].disc,
                        price: AppListData.premiumPlanList[index].price,
                      ),
                    );
                  }),
            ],
          ),
        ),
        bottomNavigationBar: CustomElevatedButton(
          onTap: () {
            Get.back();
          },
            text: "lbl_pay_now".tr,
            margin: getMargin(left: 20, right: 20, bottom: 40)));
  }

  /// Navigates to the previous screen.
  ///
  /// When the action is triggered, this function uses the [Get] package to
  /// navigate to the previous screen in the navigation stack.
  onTapArrowleftone() {
    Get.back();
  }
}
