import 'package:flutter/material.dart';
import 'package:diet_recipe_app/core/app_export.dart';
import 'package:diet_recipe_app/widgets/app_bar_text.dart';
import 'controller/privacy_policy_controller.dart';

class PrivacyPolicyScreen extends GetWidget<PrivacyPolicyController> {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

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
               AppBarText(
                onTap: () => Get.back(),
                title: 'Privacy policy',
               ),
                Padding(
                  padding: getPadding(top: 16,bottom: 8,left: 20,right: 20),
                  child: Text("msg_types_of_data_we".tr,
                      style: CustomTextStyles.titleLargeSemiBold),
                ),
                Padding(
                  padding: getPadding(left: 20,right: 20),
                  child: Text("msg_torem_ipsum_dolor".tr,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodyLarge!
                          .copyWith(height: 1.56)),
                ),
                Padding(
                    padding: getPadding(top: 16,left: 20,right: 20,bottom: 8),
                    child: Text("msg_use_of_your_personal".tr,
                        style: CustomTextStyles.titleLargeSemiBold)),
                Padding(
                  padding: getPadding(left: 20,right: 20),
                  child: Text("msg_torem_ipsum_dolor".tr,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodyLarge!
                          .copyWith(height: 1.56)),
                ),

                Padding(
                    padding: getPadding(top: 16,left: 20,right: 20,bottom: 8),
                    child: Text("msg_disclosure_of_your".tr,
                        style: CustomTextStyles.titleLargeSemiBold)),
                Padding(
                  padding: getPadding(left: 20,bottom: 20),
                  child: Text("msg_lorem_ipsum_dolor2".tr,
                      maxLines: 10,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodyLarge!
                          .copyWith(height: 1.56)),
                )
              ]),
        ));
  }

  /// Navigates to the previous screen.
  ///
  /// When the action is triggered, this function uses the [Get] package to
  /// navigate to the previous screen in the navigation stack.
  onTapArrowleftone() {
    Get.back();
  }
}
