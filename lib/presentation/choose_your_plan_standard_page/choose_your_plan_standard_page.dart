import 'controller/choose_your_plan_standard_controller.dart';import 'models/choose_your_plan_standard_model.dart';import 'package:flutter/material.dart';import 'package:diet_recipe_app/core/app_export.dart';import 'package:diet_recipe_app/widgets/custom_elevated_button.dart';import 'package:diet_recipe_app/widgets/custom_icon_button.dart';
// ignore_for_file: must_be_immutable
class ChooseYourPlanStandardPage extends StatelessWidget {ChooseYourPlanStandardPage({Key? key}) : super(key: key);

ChooseYourPlanStandardController controller = Get.put(ChooseYourPlanStandardController(ChooseYourPlanStandardModel().obs));

@override Widget build(BuildContext context) { mediaQueryData = MediaQuery.of(context); return SafeArea(child: Scaffold(backgroundColor: theme.colorScheme.onPrimaryContainer, body: SizedBox(width: mediaQueryData.size.width, child: SingleChildScrollView(child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Padding(padding: getPadding(left: 20, top: 27, right: 20), child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Row(mainAxisAlignment: MainAxisAlignment.center, children: [Expanded(child: Container(margin: getMargin(right: 10), padding: getPadding(left: 12, top: 16, right: 12, bottom: 16), decoration: AppDecoration.fillPurple.copyWith(borderRadius: BorderRadiusStyle.roundedBorder16), child: Column(mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.center, children: [CustomIconButton(height: getSize(56), width: getSize(56), padding: getPadding(all: 16), decoration: IconButtonStyleHelper.fillOnPrimaryContainer, child: CustomImageView(svgPath: ImageConstant.imgMap)), Padding(padding: getPadding(top: 11), child: Text("lbl_premium_plan".tr, style: theme.textTheme.bodyLarge))]))), Expanded(child: Container(margin: getMargin(left: 10, right: 10), padding: getPadding(left: 23, top: 16, right: 23, bottom: 16), decoration: AppDecoration.fillTeal.copyWith(borderRadius: BorderRadiusStyle.roundedBorder16), child: Column(mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.center, children: [CustomIconButton(height: getSize(56), width: getSize(56), padding: getPadding(all: 16), decoration: IconButtonStyleHelper.fillOnPrimaryContainer, child: CustomImageView(svgPath: ImageConstant.imgMail)), Padding(padding: getPadding(top: 11), child: Text("lbl_basic_plan".tr, style: theme.textTheme.bodyLarge))]))), Expanded(child: Container(margin: getMargin(left: 10), padding: getPadding(left: 13, top: 16, right: 13, bottom: 16), decoration: AppDecoration.fillCyan.copyWith(borderRadius: BorderRadiusStyle.roundedBorder16), child: Column(mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.center, children: [CustomIconButton(height: getSize(56), width: getSize(56), padding: getPadding(all: 16), decoration: IconButtonStyleHelper.fillOnPrimaryContainer, child: CustomImageView(svgPath: ImageConstant.imgGroup38133)), Padding(padding: getPadding(top: 11), child: Text("lbl_weekley_plan".tr, style: theme.textTheme.bodyLarge))])))]), CustomElevatedButton(height: getVerticalSize(57), text: "lbl_plan_duration".tr, margin: getMargin(top: 24), rightIcon: Container(margin: getMargin(left: 30), child: CustomImageView(svgPath: ImageConstant.imgArrowdown)), buttonStyle: CustomButtonStyles.fillGray, buttonTextStyle: CustomTextStyles.bodyLargeOnError_1, onTap: () {onTapPlanduration();}), CustomElevatedButton(height: getVerticalSize(57), text: "lbl_days_per_week".tr, margin: getMargin(top: 24), rightIcon: Container(margin: getMargin(left: 30), child: CustomImageView(svgPath: ImageConstant.imgArrowdown)), buttonStyle: CustomButtonStyles.fillGray, buttonTextStyle: CustomTextStyles.bodyLargeOnError_1, onTap: () {onTapDaysperweek();}), CustomElevatedButton(height: getVerticalSize(57), text: "msg_select_start_date".tr, margin: getMargin(top: 24), rightIcon: Container(margin: getMargin(left: 30), child: CustomImageView(svgPath: ImageConstant.imgArrowdown)), buttonStyle: CustomButtonStyles.fillGray, buttonTextStyle: CustomTextStyles.bodyLargeOnError_1, onTap: () {onTapSelectstart();}), CustomElevatedButton(height: getVerticalSize(57), text: "lbl_select_end_date".tr, margin: getMargin(top: 24), rightIcon: Container(margin: getMargin(left: 30), child: CustomImageView(svgPath: ImageConstant.imgArrowdown)), buttonStyle: CustomButtonStyles.fillGray, buttonTextStyle: CustomTextStyles.bodyLargeOnError_1, onTap: () {onTapSelectenddate();}), CustomElevatedButton(height: getVerticalSize(57), text: "lbl_number_of_meals".tr, margin: getMargin(top: 24), rightIcon: Container(margin: getMargin(left: 30), child: CustomImageView(svgPath: ImageConstant.imgArrowdown)), buttonStyle: CustomButtonStyles.fillGray, buttonTextStyle: CustomTextStyles.bodyLargeOnError_1, onTap: () {onTapNumberofmeals();}), CustomElevatedButton(height: getVerticalSize(57), text: "lbl_select_month".tr, margin: getMargin(top: 24), rightIcon: Container(margin: getMargin(left: 30), child: CustomImageView(svgPath: ImageConstant.imgArrowdown)), buttonStyle: CustomButtonStyles.fillGray, buttonTextStyle: CustomTextStyles.bodyLargeOnError_1, onTap: () {onTapSelectmonth();}), CustomElevatedButton(height: getVerticalSize(57), text: "msg_number_of_snacks".tr, margin: getMargin(top: 24), rightIcon: Container(margin: getMargin(left: 30), child: CustomImageView(svgPath: ImageConstant.imgArrowdown)), buttonStyle: CustomButtonStyles.fillGray, buttonTextStyle: CustomTextStyles.bodyLargeOnError_1, onTap: () {onTapNumberof();}), CustomElevatedButton(height: getVerticalSize(57), text: "lbl_number_of_weeks".tr, margin: getMargin(top: 24), rightIcon: Container(margin: getMargin(left: 30), child: CustomImageView(svgPath: ImageConstant.imgArrowdown)), buttonStyle: CustomButtonStyles.fillGray, buttonTextStyle: CustomTextStyles.bodyLargeOnError_1, onTap: () {onTapNumberofweeks();}), CustomElevatedButton(text: "lbl_continue".tr, margin: getMargin(top: 48))]))]))))); } 
/// Navigates to the planDurationScreen when the action is triggered.

/// When the action is triggered, this function uses the [Get] package to
/// push the named route for the planDurationScreen.
onTapPlanduration() { Get.toNamed(AppRoutes.planDurationScreen, ); } 
/// Navigates to the daysPerWeekScreen when the action is triggered.

/// When the action is triggered, this function uses the [Get] package to
/// push the named route for the daysPerWeekScreen.
onTapDaysperweek() { Get.toNamed(AppRoutes.daysPerWeekScreen, ); } 
/// Navigates to the selectDateScreen when the action is triggered.

/// When the action is triggered, this function uses the [Get] package to
/// push the named route for the selectDateScreen.
onTapSelectstart() { Get.toNamed(AppRoutes.selectDateScreen, ); } 
/// Navigates to the selectDateScreen when the action is triggered.

/// When the action is triggered, this function uses the [Get] package to
/// push the named route for the selectDateScreen.
onTapSelectenddate() { Get.toNamed(AppRoutes.selectDateScreen, ); } 
/// Navigates to the numberOfMealsScreen when the action is triggered.

/// When the action is triggered, this function uses the [Get] package to
/// push the named route for the numberOfMealsScreen.
onTapNumberofmeals() { Get.toNamed(AppRoutes.numberOfMealsScreen, ); } 
/// Navigates to the selectMonthScreen when the action is triggered.

/// When the action is triggered, this function uses the [Get] package to
/// push the named route for the selectMonthScreen.
onTapSelectmonth() { Get.toNamed(AppRoutes.selectMonthScreen, ); } 
/// Navigates to the numberOfSnacksScreen when the action is triggered.

/// When the action is triggered, this function uses the [Get] package to
/// push the named route for the numberOfSnacksScreen.
onTapNumberof() { Get.toNamed(AppRoutes.numberOfSnacksScreen, ); } 
/// Navigates to the numberOfWeeksScreen when the action is triggered.

/// When the action is triggered, this function uses the [Get] package to
/// push the named route for the numberOfWeeksScreen.
onTapNumberofweeks() { Get.toNamed(AppRoutes.numberOfWeeksScreen, ); } 
 }
