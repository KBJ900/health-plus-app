import 'package:flutter/material.dart';
import 'package:diet_recipe_app/core/app_export.dart';
import 'package:diet_recipe_app/core/utils/validation_functions.dart';
import 'package:diet_recipe_app/presentation/add_new_card_screen/widget/date_cvv.dart';
import 'package:diet_recipe_app/widgets/app_bar_text.dart';
import 'package:diet_recipe_app/widgets/custom_drop_down.dart';
import 'package:diet_recipe_app/widgets/custom_elevated_button.dart';
import 'package:diet_recipe_app/widgets/custom_text_form_field.dart';

import 'controller/add_new_card_controller.dart';

// ignore_for_file: must_be_immutable
class AddNewCardScreen extends GetWidget<AddNewCardController> {
  AddNewCardScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: theme.colorScheme.onPrimaryContainer,
        body: SafeArea(
          child: Form(
              key: _formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    AppBarText(
                     onTap: () => Get.back(),
                     title: 'Add new card',
                    ),
                    Padding(
                      padding:getPadding(left: 20,right: 20,top: 24,bottom: 24),
                      child: CustomDropDown(
                          icon: Container(
                              margin: getMargin(left: 30, right: 16),
                              child: CustomImageView(
                                  svgPath: ImageConstant.imgArrowdown)),
                          hintText: "msg_select_card_type".tr,
                          hintStyle: CustomTextStyles.bodyLargeOnError_1,
                          items: controller.addNewCardModelObj.value
                              .dropdownItemList.value,
                          onChanged: (value) {
                            controller.onSelected(value);
                          }),
                    ),
                    CustomTextFormField(
                        controller: controller.nameController,
                        hintText: "msg_card_holder_name".tr,
                        hintStyle: CustomTextStyles.bodyLargeOnError_1,
                        validator: (value) {
                          if (!isText(value)) {
                            return "Please enter valid text";
                          }
                          return null;
                        }),
                    Padding(
                      padding: getPadding(top: 24,bottom: 24),
                      child: CustomTextFormField(
                          controller: controller.cardNumberController,

                          hintText: "lbl_card_number".tr,
                          hintStyle: CustomTextStyles.bodyLargeOnError_1,
                          textInputType: TextInputType.number,
                          validator: (value) {
                            if (!isNumeric(value)) {
                              return "Please enter valid number";
                            }
                            return null;
                          }),
                    ),
                    Padding(
                      padding: getPadding(left: 20,right: 20),
                      child: DateCvv(),
                    ),
                  ])),
        ),
        bottomNavigationBar: CustomElevatedButton(
            text: "lbl_add".tr,
            margin: getMargin(left: 20, right: 20, bottom: 40),
            onTap: () {
              onTapAdd();
            }));
  }

  onTapAdd() {
    Get.toNamed(
      AppRoutes.paymentScreen,
    );
  }

  onTapAddnewcard() {
    Get.toNamed(
      AppRoutes.paymentScreen,
    );
  }
}
