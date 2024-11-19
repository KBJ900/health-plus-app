import 'package:flutter/material.dart';
import 'package:diet_recipe_app/core/app_export.dart';
import 'package:diet_recipe_app/widgets/app_bar_text.dart';
import 'package:diet_recipe_app/widgets/custom_drop_down.dart';
import 'package:diet_recipe_app/widgets/custom_elevated_button.dart';
import 'package:diet_recipe_app/widgets/custom_text_form_field.dart';

import 'controller/add_new_address_controller.dart';

class AddNewAddressScreen extends GetWidget<AddNewAddressController> {
  const AddNewAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: theme.colorScheme.onPrimaryContainer,
        body: SafeArea(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            AppBarText(
              onTap: () => Get.back(),
              title: 'Add new address',
            ),
            Padding(
              padding: getPadding(top: 24, bottom: 24),
              child: CustomTextFormField(
                  controller: controller.addressController,
                  hintText: "lbl_new_address".tr,
                  hintStyle: CustomTextStyles.bodyLargeOnError_1),
            ),
            Padding(
              padding: getPadding(left: 20,right: 20,bottom: 24),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center, children: [
                Expanded(
                    child: CustomDropDown(


                        icon: Container(
                          padding: EdgeInsets.zero,
                            margin: getMargin(left: 30, right: 16),
                            child: CustomImageView(
                                svgPath: ImageConstant.imgArrowdown)),
                        margin: getMargin(right: 8),
                        hintText: "lbl_select_stat".tr,
                        hintStyle: CustomTextStyles.bodyLargeOnError_1,
                        items: controller
                            .addNewAddressModelObj.value.dropdownItemList.value,
                        onChanged: (value) {
                          controller.onSelected(value);
                        })),
                Expanded(
                    child: CustomDropDown(

                        icon: Container(
                            margin: getMargin(left: 30, right: 16),
                            child: CustomImageView(
                                svgPath: ImageConstant.imgArrowdown)),


                        margin: getMargin(left: 8),
                        hintText: "lbl_select_city".tr,
                        hintStyle: CustomTextStyles.bodyLargeOnError_1,
                        items: controller
                            .addNewAddressModelObj.value.dropdownItemList1.value,
                        onChanged: (value) {
                          controller.onSelected1(value);
                        }))
              ]),
            ),
            CustomTextFormField(
                controller: controller.streetnameoneController,

                hintText: "lbl_street".tr,
                hintStyle: CustomTextStyles.bodyLargeOnError_1,
                textInputAction: TextInputAction.done)
          ]),
        ),
        bottomNavigationBar: CustomElevatedButton(
            text: "lbl_add".tr,
            margin: getMargin(left: 20, right: 20, bottom: 40),
            onTap: () {
              onTapAdd();
            }));
  }

  onTapAddnewaddress() {
    Get.toNamed(
      AppRoutes.addressScreen,
    );
  }

  onTapAdd() {
    Get.toNamed(
      AppRoutes.addressScreen,
    );
  }
}
