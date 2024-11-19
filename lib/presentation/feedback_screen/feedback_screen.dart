import 'package:flutter/material.dart';
import 'package:diet_recipe_app/core/app_export.dart';
import 'package:diet_recipe_app/widgets/app_bar_text.dart';
import 'package:diet_recipe_app/widgets/custom_elevated_button.dart';
import 'package:diet_recipe_app/widgets/custom_text_form_field.dart';

import 'controller/feedback_controller.dart';

class FeedbackScreen extends GetWidget<FeedbackController> {
  const FeedbackScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: theme.colorScheme.onPrimaryContainer,

        body: SafeArea(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
               AppBarText(
                onTap: () => Get.back(),
                title: 'Feedback',
               ),
                Padding(
                  padding:getPadding(left: 20,top: 16),
                  child: Text("msg_what_do_you_like".tr,
                      style: CustomTextStyles.titleLargeSemiBold),
                ),
                Padding(
                  padding: getPadding(top: 16),
                  child: CustomTextFormField(
                      controller: controller.feedbackinputController,
                      textStyle: theme.textTheme.bodyLarge,

                      hintText: "msg_write_your_feedback".tr,
                      hintStyle: CustomTextStyles.bodyLargeOnError_1,
                      textInputAction: TextInputAction.done,
                      maxLines: 6),
                )
              ]),
        ),
        bottomNavigationBar: CustomElevatedButton(
         onTap: () => Get.back(),
            text: "lbl_submit".tr,
            margin: getMargin(left: 20, right: 20, bottom: 40)));
  }


  onTapArrowleftone() {
    Get.back();
  }
}
