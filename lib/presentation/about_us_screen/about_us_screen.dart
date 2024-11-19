import 'package:flutter/material.dart';
import 'package:diet_recipe_app/core/app_export.dart';
import 'package:diet_recipe_app/widgets/app_bar_text.dart';
import 'controller/about_us_controller.dart';

class AboutUsScreen extends GetWidget<AboutUsController> {
  const AboutUsScreen({Key? key}) : super(key: key);

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
                 title: 'About us',
                 onTap: () => Get.back(),
                ),
                Container(
                 margin: getMargin(left: 20,right: 20),
                 height: getSize(160),
                 width: double.infinity,
                 clipBehavior: Clip.antiAlias,
                 decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(getHorizontalSize(16))
                 ),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgRectangle712,
                   fit: BoxFit.cover,
                  ),
                ),
                Padding(
                    padding: getPadding(top: 16,left: 20,right: 20,bottom: 16),
                    child: Text("msg_water_is_absolutely".tr,
                        style: CustomTextStyles.titleLargeSemiBold)),
                Padding(
                  padding: getPadding(left: 20,right: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("msg_lorem_ipsum_dolor".tr,
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextStyles.bodyLargeGray800
                              .copyWith(height: 1.56)),
                      Padding(
                        padding: getPadding(top: 8,bottom: 8),
                        child: Text("msg_amet_minim_mollit".tr,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.bodyLarge!
                                .copyWith(height: 1.56)),
                      ),
                      Text("msg_in_a_laoreet_purus".tr,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.bodyLarge!
                              .copyWith(height: 1.56)),
                      Padding(
                        padding: getPadding(top: 8,bottom: 8),
                        child: Text("msg_ivorem_ipsum_dolor".tr,
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.bodyLarge!
                                .copyWith(height: 1.56)),
                      ),
                      Text("msg_amet_minim_mollit2".tr,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.bodyLarge!
                              .copyWith(height: 1.56)),
                      Padding(
                        padding: getPadding(top: 8,bottom: 8),
                        child: Text("msg_ivorem_ipsum_dolor".tr,
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.bodyLarge!
                                .copyWith(height: 1.56)),
                      )
                    ],
                  ),
                )
              ]
          ),
        )
    );
  }

  /// Navigates to the settingsScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the settingsScreen.
  onTapAboutus() {
    Get.toNamed(
      AppRoutes.settingsScreen,
    );
  }
}
