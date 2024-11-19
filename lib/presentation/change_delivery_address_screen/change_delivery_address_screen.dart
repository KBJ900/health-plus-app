import 'package:flutter/material.dart';
import 'package:diet_recipe_app/core/app_export.dart';
import 'package:diet_recipe_app/presentation/select_date_screen/controller/select_date_controller.dart';
import 'package:diet_recipe_app/widgets/app_bar_text.dart';
import 'package:diet_recipe_app/widgets/custom_elevated_button.dart';

import 'controller/change_delivery_address_controller.dart';

class ChangeDeliveryAddressScreen
    extends GetWidget<ChangeDeliveryAddressController> {
  const ChangeDeliveryAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
        backgroundColor: theme.colorScheme.onPrimaryContainer,
        
        body: SafeArea(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
               AppBarText(
                title: 'Delivery address',
                onTap: () => Get.back(),
               ),
                GetBuilder<SelectDateController>(builder: (sController) {
                  return GestureDetector(
                    onTap: () {
                      onTapSelectdate();
                    },
                    child: Container(
                      margin: getMargin(top: 24,left: 20,right: 20),
                      decoration: BoxDecoration(
                        color: AppColor.grey100,
                        borderRadius: BorderRadius.circular(getHorizontalSize(16)),
                      ),
                      child: Padding(
                        padding: getPadding(all: 16),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(sController.selectedDate != null ?sController.selectedDate!:'Select date',style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: getFontSize(16),
                                color: AppColor.grey400,
                              ),),
                            ),
                            CustomImageView(
                                svgPath: ImageConstant.imgArrowrightOnerror),
                          ],
                        ),
                      ),
                    ),
                  );
                },init: SelectDateController(),),
                Container(
                    margin: getMargin(top: 16,left: 16,right: 16),
                    padding: getPadding(all: 16),
                    decoration: AppDecoration.fillGray.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder16),
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                              
                              children: [
                                Expanded(
                                  child: Padding(
                                      padding: getPadding(bottom: 1),
                                      child: Text("Home".tr,
                                          style:
                                          theme.textTheme.titleMedium)),
                                ),
                                CustomImageView(
                                    svgPath: ImageConstant.imgEdit,
                                    height: getSize(24),
                                    width: getSize(24))
                              ]),
                          Padding(
                            padding: getPadding(top: 16,right: 100),
                            child: Text("msg_4517_washington".tr,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: theme.textTheme.bodyLarge!
                                    .copyWith(height: 1.56)),
                          )
                        ])),
                Container(
                    margin: getMargin(top: 16,left: 16,right: 16),
                    padding: getPadding(all: 16),
                    decoration: AppDecoration.fillGray.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder16),
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(

                              children: [
                                Expanded(
                                  child: Padding(
                                      padding: getPadding(bottom: 1),
                                      child: Text("Office ".tr,
                                          style:
                                          theme.textTheme.titleMedium)),
                                ),
                                CustomImageView(
                                    svgPath: ImageConstant.imgEdit,
                                    height: getSize(24),
                                    width: getSize(24))
                              ]),
                          Padding(
                            padding: getPadding(top: 16,right: 100),
                            child: Text("msg_4517_washington".tr,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: theme.textTheme.bodyLarge!
                                    .copyWith(height: 1.56)),
                          )
                        ])),

                GestureDetector(
                  onTap: () {
                    onTapAddnewaddress();
                  },
                  child: Padding(
                    padding: getPadding(top: 18),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: getPadding(right: 8),
                          child: Icon(Icons.add,color: Colors.black,size: getSize(24),),
                        ),
                        Text('Add new address',style:theme.textTheme.bodyLarge),
                      ],
                    ),
                  ),
                )
              ]),
        ),
        bottomNavigationBar: CustomElevatedButton(
            text: "lbl_change".tr,
            margin: getMargin(left: 20, right: 20, bottom: 40),
            onTap: () {
              onTapChange();
            }
            )
    );
  }


  onTapDelivery() {
    Get.toNamed(
      AppRoutes.homeScreenContainerScreen,
    );
  }

  onTapChange() {
    Get.toNamed(
      AppRoutes.homeScreenContainerScreen,
    );
  }

  onTapSelectdate() {
    Get.toNamed(
      AppRoutes.selectDateScreen,
    );
  }

  onTapHome() {
    Get.toNamed(
      AppRoutes.addNewAddressScreen,
    );
  }

  onTapAddnewaddress() {
    Get.toNamed(
      AppRoutes.addNewAddressScreen,
    );
  }
}
