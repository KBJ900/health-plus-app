import 'controller/app_navigation_controller.dart';import 'package:flutter/material.dart';import 'package:diet_recipe_app/core/app_export.dart';class AppNavigationScreen extends GetWidget<AppNavigationController> {const AppNavigationScreen({Key? key}) : super(key: key);

@override Widget build(BuildContext context) { mediaQueryData = MediaQuery.of(context); return SafeArea(child: Scaffold(backgroundColor: theme.colorScheme.onSecondary, body: SizedBox(width: getHorizontalSize(375), child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Container(decoration: AppDecoration.fillOnSecondary, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_app_navigation".tr, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20), child: Text("msg_check_your_app_s".tr, textAlign: TextAlign.center, style: TextStyle(color: appTheme.blueGray400, fontSize: getFontSize(16), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.black900))])), Expanded(child: SingleChildScrollView(child: Container(decoration: AppDecoration.fillOnSecondary, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [GestureDetector(onTap: () {onTapSplaceScreen();}, child: Container(decoration: AppDecoration.fillOnSecondary, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_splace_screen".tr, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray400))]))), GestureDetector(onTap: () {onTapOnboardingOne();}, child: Container(decoration: AppDecoration.fillOnSecondary, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_onboarding_one".tr, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray400))]))), GestureDetector(onTap: () {onTapOnboardingTwo();}, child: Container(decoration: AppDecoration.fillOnSecondary, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_onboarding_two".tr, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray400))]))), GestureDetector(onTap: () {onTapOnboardingThree();}, child: Container(decoration: AppDecoration.fillOnSecondary, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("msg_onboarding_three".tr, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray400))]))), GestureDetector(onTap: () {onTapOnboardingFour();}, child: Container(decoration: AppDecoration.fillOnSecondary, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_onboarding_four".tr, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray400))]))), GestureDetector(onTap: () {onTapOnboardingFive();}, child: Container(decoration: AppDecoration.fillOnSecondary, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_onboarding_five".tr, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray400))]))), GestureDetector(onTap: () {onTapOnboardingSix();}, child: Container(decoration: AppDecoration.fillOnSecondary, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_onboarding_six".tr, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray400))]))), GestureDetector(onTap: () {onTapLogin();}, child: Container(decoration: AppDecoration.fillOnSecondary, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_login".tr, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray400))]))), GestureDetector(onTap: () {onTapLoginerror();}, child: Container(decoration: AppDecoration.fillOnSecondary, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_login_error".tr, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray400))]))), GestureDetector(onTap: () {onTapLoginfilled();}, child: Container(decoration: AppDecoration.fillOnSecondary, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_login_filled".tr, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray400))]))), GestureDetector(onTap: () {onTapSignup();}, child: Container(decoration: AppDecoration.fillOnSecondary, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_signup2".tr, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray400))]))), GestureDetector(onTap: () {onTapForgotpassword();}, child: Container(decoration: AppDecoration.fillOnSecondary, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("msg_forgot_password".tr, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray400))]))), GestureDetector(onTap: () {onTapVerification();}, child: Container(decoration: AppDecoration.fillOnSecondary, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_verification".tr, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray400))]))), GestureDetector(onTap: () {onTapVerificationOne();}, child: Container(decoration: AppDecoration.fillOnSecondary, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("msg_verification_one".tr, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray400))]))), GestureDetector(onTap: () {onTapVerificationconfirm();}, child: Container(decoration: AppDecoration.fillOnSecondary, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("msg_verification_confirm".tr, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray400))]))), GestureDetector(onTap: () {onTapHomescreenContainer();}, child: Container(decoration: AppDecoration.fillOnSecondary, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("msg_home_screen_container".tr, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray400))]))), GestureDetector(onTap: () {onTapWhatforlunch();}, child: Container(decoration: AppDecoration.fillOnSecondary, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_what_for_lunch".tr, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray400))]))), GestureDetector(onTap: () {onTapRecommendations();}, child: Container(decoration: AppDecoration.fillOnSecondary, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_recommendations".tr, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray400))]))), GestureDetector(onTap: () {onTapMovedays();}, child: Container(decoration: AppDecoration.fillOnSecondary, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_move_days".tr, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray400))]))), GestureDetector(onTap: () {onTapAddmenuTabContainer();}, child: Container(decoration: AppDecoration.fillOnSecondary, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("msg_add_menu_tab_container".tr, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray400))]))), GestureDetector(onTap: () {onTapChangedeliveryaddress();}, child: Container(decoration: AppDecoration.fillOnSecondary, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("msg_change_delivery".tr, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray400))]))), GestureDetector(onTap: () {onTapSelectdate();}, child: Container(decoration: AppDecoration.fillOnSecondary, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_select_date".tr, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray400))]))), GestureDetector(onTap: () {onTapNotifications();}, child: Container(decoration: AppDecoration.fillOnSecondary, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_notifications".tr, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray400))]))), GestureDetector(onTap: () {onTapDetails();}, child: Container(decoration: AppDecoration.fillOnSecondary, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_details".tr, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray400))]))), GestureDetector(onTap: () {onTapMycart();}, child: Container(decoration: AppDecoration.fillOnSecondary, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_my_cart".tr, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray400))]))), GestureDetector(onTap: () {onTapAddress();}, child: Container(decoration: AppDecoration.fillOnSecondary, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_address".tr, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray400))]))), GestureDetector(onTap: () {onTapAddnewaddress();}, child: Container(decoration: AppDecoration.fillOnSecondary, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_add_new_address".tr, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray400))]))), GestureDetector(onTap: () {onTapPayment();}, child: Container(decoration: AppDecoration.fillOnSecondary, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_payment".tr, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray400))]))), GestureDetector(onTap: () {onTapAddnewcard();}, child: Container(decoration: AppDecoration.fillOnSecondary, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_add_new_card".tr, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray400))]))), GestureDetector(onTap: () {onTapCheckout();}, child: Container(decoration: AppDecoration.fillOnSecondary, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_check_out".tr, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray400))]))), GestureDetector(onTap: () {onTapOrdersuccessfull();}, child: Container(decoration: AppDecoration.fillOnSecondary, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("msg_order_successfull".tr, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray400))]))), GestureDetector(onTap: () {onTapTrackorderOne();}, child: Container(decoration: AppDecoration.fillOnSecondary, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_track_order_one".tr, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray400))]))), GestureDetector(onTap: () {onTapTrackorder();}, child: Container(decoration: AppDecoration.fillOnSecondary, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_track_order".tr, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray400))]))), GestureDetector(onTap: () {onTapChooseyourplanStandardTabContainer();}, child: Container(decoration: AppDecoration.fillOnSecondary, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("msg_choose_your_plan2".tr, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray400))]))), GestureDetector(onTap: () {onTapPlanduration();}, child: Container(decoration: AppDecoration.fillOnSecondary, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_plan_duration".tr, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray400))]))), GestureDetector(onTap: () {onTapDaysperweek();}, child: Container(decoration: AppDecoration.fillOnSecondary, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_days_per_week".tr, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray400))]))), GestureDetector(onTap: () {onTapSelectmonth();}, child: Container(decoration: AppDecoration.fillOnSecondary, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_select_month".tr, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray400))]))), GestureDetector(onTap: () {onTapNumberofmeals();}, child: Container(decoration: AppDecoration.fillOnSecondary, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_number_of_meals".tr, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray400))]))), GestureDetector(onTap: () {onTapNumberofsnacks();}, child: Container(decoration: AppDecoration.fillOnSecondary, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("msg_number_of_snacks".tr, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray400))]))), GestureDetector(onTap: () {onTapNumberofweeks();}, child: Container(decoration: AppDecoration.fillOnSecondary, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_number_of_weeks".tr, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray400))]))), GestureDetector(onTap: () {onTapRunningplandetails();}, child: Container(decoration: AppDecoration.fillOnSecondary, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("msg_running_plan_details".tr, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray400))]))), GestureDetector(onTap: () {onTapMyprofile();}, child: Container(decoration: AppDecoration.fillOnSecondary, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_my_profile".tr, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray400))]))), GestureDetector(onTap: () {onTapEditprofile();}, child: Container(decoration: AppDecoration.fillOnSecondary, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_edit_profile".tr, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray400))]))), GestureDetector(onTap: () {onTapSettings();}, child: Container(decoration: AppDecoration.fillOnSecondary, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_settings".tr, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray400))]))), GestureDetector(onTap: () {onTapAboutus();}, child: Container(decoration: AppDecoration.fillOnSecondary, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_about_us".tr, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray400))]))), GestureDetector(onTap: () {onTapHelp();}, child: Container(decoration: AppDecoration.fillOnSecondary, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_help".tr, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray400))]))), GestureDetector(onTap: () {onTapFeedback();}, child: Container(decoration: AppDecoration.fillOnSecondary, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_feedback".tr, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray400))]))), GestureDetector(onTap: () {onTapPrivacypolicy();}, child: Container(decoration: AppDecoration.fillOnSecondary, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_privacy_policy".tr, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray400))]))), GestureDetector(onTap: () {onTapPremium();}, child: Container(decoration: AppDecoration.fillOnSecondary, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), child: Text("lbl_premium".tr, textAlign: TextAlign.center, style: TextStyle(color: appTheme.black900, fontSize: getFontSize(20), fontFamily: 'Roboto', fontWeight: FontWeight.w400)))), Padding(padding: getPadding(top: 5), child: Divider(height: getVerticalSize(1), thickness: getVerticalSize(1), color: appTheme.blueGray400))])))]))))])))); } 
/// Navigates to the splaceScreen when the action is triggered.

/// When the action is triggered, this function uses the [Get] package to
/// push the named route for the splaceScreen.
onTapSplaceScreen() { Get.toNamed(AppRoutes.splaceScreen, ); } 
/// Navigates to the onboardingOneScreen when the action is triggered.

/// When the action is triggered, this function uses the [Get] package to
/// push the named route for the onboardingOneScreen.
onTapOnboardingOne() { Get.toNamed(AppRoutes.onboardingOneScreen, ); } 
/// Navigates to the onboardingTwoScreen when the action is triggered.

/// When the action is triggered, this function uses the [Get] package to
/// push the named route for the onboardingTwoScreen.
onTapOnboardingTwo() { Get.toNamed(AppRoutes.onboardingTwoScreen, ); } 
/// Navigates to the onboardingThreeScreen when the action is triggered.

/// When the action is triggered, this function uses the [Get] package to
/// push the named route for the onboardingThreeScreen.
onTapOnboardingThree() { Get.toNamed(AppRoutes.onboardingThreeScreen, ); } 
/// Navigates to the onboardingFourScreen when the action is triggered.

/// When the action is triggered, this function uses the [Get] package to
/// push the named route for the onboardingFourScreen.
onTapOnboardingFour() { Get.toNamed(AppRoutes.onboardingFourScreen, ); } 
/// Navigates to the onboardingFiveScreen when the action is triggered.

/// When the action is triggered, this function uses the [Get] package to
/// push the named route for the onboardingFiveScreen.
onTapOnboardingFive() { Get.toNamed(AppRoutes.onboardingFiveScreen, ); } 
/// Navigates to the onboardingSixScreen when the action is triggered.

/// When the action is triggered, this function uses the [Get] package to
/// push the named route for the onboardingSixScreen.
onTapOnboardingSix() { Get.toNamed(AppRoutes.onboardingSixScreen, ); } 
/// Navigates to the loginScreen when the action is triggered.

/// When the action is triggered, this function uses the [Get] package to
/// push the named route for the loginScreen.
onTapLogin() { Get.toNamed(AppRoutes.loginScreen, ); } 
/// Navigates to the loginErrorScreen when the action is triggered.

/// When the action is triggered, this function uses the [Get] package to
/// push the named route for the loginErrorScreen.
onTapLoginerror() { Get.toNamed(AppRoutes.loginErrorScreen, ); } 
/// Navigates to the loginFilledScreen when the action is triggered.

/// When the action is triggered, this function uses the [Get] package to
/// push the named route for the loginFilledScreen.
onTapLoginfilled() { Get.toNamed(AppRoutes.loginFilledScreen, ); } 
/// Navigates to the signupScreen when the action is triggered.

/// When the action is triggered, this function uses the [Get] package to
/// push the named route for the signupScreen.
onTapSignup() { Get.toNamed(AppRoutes.signupScreen, ); } 
/// Navigates to the forgotPasswordScreen when the action is triggered.

/// When the action is triggered, this function uses the [Get] package to
/// push the named route for the forgotPasswordScreen.
onTapForgotpassword() { Get.toNamed(AppRoutes.forgotPasswordScreen, ); } 
/// Navigates to the verificationScreen when the action is triggered.

/// When the action is triggered, this function uses the [Get] package to
/// push the named route for the verificationScreen.
onTapVerification() { Get.toNamed(AppRoutes.verificationScreen, ); } 
/// Navigates to the verificationOneScreen when the action is triggered.

/// When the action is triggered, this function uses the [Get] package to
/// push the named route for the verificationOneScreen.
onTapVerificationOne() { Get.toNamed(AppRoutes.verificationOneScreen, ); } 
/// Navigates to the verificationConfirmScreen when the action is triggered.

/// When the action is triggered, this function uses the [Get] package to
/// push the named route for the verificationConfirmScreen.
onTapVerificationconfirm() { Get.toNamed(AppRoutes.verificationConfirmScreen, ); } 
/// Navigates to the homeScreenContainerScreen when the action is triggered.

/// When the action is triggered, this function uses the [Get] package to
/// push the named route for the homeScreenContainerScreen.
onTapHomescreenContainer() { Get.toNamed(AppRoutes.homeScreenContainerScreen, ); } 
/// Navigates to the whatForLunchScreen when the action is triggered.

/// When the action is triggered, this function uses the [Get] package to
/// push the named route for the whatForLunchScreen.
onTapWhatforlunch() { Get.toNamed(AppRoutes.whatForLunchScreen, ); } 
/// Navigates to the recommendationsScreen when the action is triggered.

/// When the action is triggered, this function uses the [Get] package to
/// push the named route for the recommendationsScreen.
onTapRecommendations() { Get.toNamed(AppRoutes.recommendationsScreen, ); } 
/// Navigates to the moveDaysScreen when the action is triggered.

/// When the action is triggered, this function uses the [Get] package to
/// push the named route for the moveDaysScreen.
onTapMovedays() { Get.toNamed(AppRoutes.moveDaysScreen, ); } 
/// Navigates to the addMenuTabContainerScreen when the action is triggered.

/// When the action is triggered, this function uses the [Get] package to
/// push the named route for the addMenuTabContainerScreen.
onTapAddmenuTabContainer() { Get.toNamed(AppRoutes.addMenuTabContainerScreen, ); } 
/// Navigates to the changeDeliveryAddressScreen when the action is triggered.

/// When the action is triggered, this function uses the [Get] package to
/// push the named route for the changeDeliveryAddressScreen.
onTapChangedeliveryaddress() { Get.toNamed(AppRoutes.changeDeliveryAddressScreen, ); } 
/// Navigates to the selectDateScreen when the action is triggered.

/// When the action is triggered, this function uses the [Get] package to
/// push the named route for the selectDateScreen.
onTapSelectdate() { Get.toNamed(AppRoutes.selectDateScreen, ); } 
/// Navigates to the notificationsScreen when the action is triggered.

/// When the action is triggered, this function uses the [Get] package to
/// push the named route for the notificationsScreen.
onTapNotifications() { Get.toNamed(AppRoutes.notificationsScreen, ); } 
/// Navigates to the detailsScreen when the action is triggered.

/// When the action is triggered, this function uses the [Get] package to
/// push the named route for the detailsScreen.
onTapDetails() { Get.toNamed(AppRoutes.detailsScreen, ); } 
/// Navigates to the myCartScreen when the action is triggered.

/// When the action is triggered, this function uses the [Get] package to
/// push the named route for the myCartScreen.
onTapMycart() { Get.toNamed(AppRoutes.myCartScreen, ); } 
/// Navigates to the addressScreen when the action is triggered.

/// When the action is triggered, this function uses the [Get] package to
/// push the named route for the addressScreen.
onTapAddress() { Get.toNamed(AppRoutes.addressScreen, ); } 
/// Navigates to the addNewAddressScreen when the action is triggered.

/// When the action is triggered, this function uses the [Get] package to
/// push the named route for the addNewAddressScreen.
onTapAddnewaddress() { Get.toNamed(AppRoutes.addNewAddressScreen, ); } 
/// Navigates to the paymentScreen when the action is triggered.

/// When the action is triggered, this function uses the [Get] package to
/// push the named route for the paymentScreen.
onTapPayment() { Get.toNamed(AppRoutes.paymentScreen, ); } 
/// Navigates to the addNewCardScreen when the action is triggered.

/// When the action is triggered, this function uses the [Get] package to
/// push the named route for the addNewCardScreen.
onTapAddnewcard() { Get.toNamed(AppRoutes.addNewCardScreen, ); } 
/// Navigates to the checkOutScreen when the action is triggered.

/// When the action is triggered, this function uses the [Get] package to
/// push the named route for the checkOutScreen.
onTapCheckout() { Get.toNamed(AppRoutes.checkOutScreen, ); } 
/// Navigates to the orderSuccessfullScreen when the action is triggered.

/// When the action is triggered, this function uses the [Get] package to
/// push the named route for the orderSuccessfullScreen.
onTapOrdersuccessfull() { Get.toNamed(AppRoutes.orderSuccessfullScreen, ); } 
/// Navigates to the trackOrderOneScreen when the action is triggered.

/// When the action is triggered, this function uses the [Get] package to
/// push the named route for the trackOrderOneScreen.
onTapTrackorderOne() { Get.toNamed(AppRoutes.trackOrderOneScreen, ); } 
/// Navigates to the trackOrderScreen when the action is triggered.

/// When the action is triggered, this function uses the [Get] package to
/// push the named route for the trackOrderScreen.
onTapTrackorder() { Get.toNamed(AppRoutes.trackOrderScreen, ); } 
/// Navigates to the chooseYourPlanStandardTabContainerScreen when the action is triggered.

/// When the action is triggered, this function uses the [Get] package to
/// push the named route for the chooseYourPlanStandardTabContainerScreen.
onTapChooseyourplanStandardTabContainer() { Get.toNamed(AppRoutes.chooseYourPlanStandardTabContainerScreen, ); } 
/// Navigates to the planDurationScreen when the action is triggered.

/// When the action is triggered, this function uses the [Get] package to
/// push the named route for the planDurationScreen.
onTapPlanduration() { Get.toNamed(AppRoutes.planDurationScreen, ); } 
/// Navigates to the daysPerWeekScreen when the action is triggered.

/// When the action is triggered, this function uses the [Get] package to
/// push the named route for the daysPerWeekScreen.
onTapDaysperweek() { Get.toNamed(AppRoutes.daysPerWeekScreen, ); } 
/// Navigates to the selectMonthScreen when the action is triggered.

/// When the action is triggered, this function uses the [Get] package to
/// push the named route for the selectMonthScreen.
onTapSelectmonth() { Get.toNamed(AppRoutes.selectMonthScreen, ); } 
/// Navigates to the numberOfMealsScreen when the action is triggered.

/// When the action is triggered, this function uses the [Get] package to
/// push the named route for the numberOfMealsScreen.
onTapNumberofmeals() { Get.toNamed(AppRoutes.numberOfMealsScreen, ); } 
/// Navigates to the numberOfSnacksScreen when the action is triggered.

/// When the action is triggered, this function uses the [Get] package to
/// push the named route for the numberOfSnacksScreen.
onTapNumberofsnacks() { Get.toNamed(AppRoutes.numberOfSnacksScreen, ); } 
/// Navigates to the numberOfWeeksScreen when the action is triggered.

/// When the action is triggered, this function uses the [Get] package to
/// push the named route for the numberOfWeeksScreen.
onTapNumberofweeks() { Get.toNamed(AppRoutes.numberOfWeeksScreen, ); } 
/// Navigates to the runningPlanDetailsScreen when the action is triggered.

/// When the action is triggered, this function uses the [Get] package to
/// push the named route for the runningPlanDetailsScreen.
onTapRunningplandetails() { Get.toNamed(AppRoutes.runningPlanDetailsScreen, ); } 
/// Navigates to the myProfileScreen when the action is triggered.

/// When the action is triggered, this function uses the [Get] package to
/// push the named route for the myProfileScreen.
onTapMyprofile() { Get.toNamed(AppRoutes.myProfileScreen, ); } 
/// Navigates to the editProfileScreen when the action is triggered.

/// When the action is triggered, this function uses the [Get] package to
/// push the named route for the editProfileScreen.
onTapEditprofile() { Get.toNamed(AppRoutes.editProfileScreen, ); } 
/// Navigates to the settingsScreen when the action is triggered.

/// When the action is triggered, this function uses the [Get] package to
/// push the named route for the settingsScreen.
onTapSettings() { Get.toNamed(AppRoutes.settingsScreen, ); } 
/// Navigates to the aboutUsScreen when the action is triggered.

/// When the action is triggered, this function uses the [Get] package to
/// push the named route for the aboutUsScreen.
onTapAboutus() { Get.toNamed(AppRoutes.aboutUsScreen, ); } 
/// Navigates to the helpScreen when the action is triggered.

/// When the action is triggered, this function uses the [Get] package to
/// push the named route for the helpScreen.
onTapHelp() { Get.toNamed(AppRoutes.helpScreen, ); } 
/// Navigates to the feedbackScreen when the action is triggered.

/// When the action is triggered, this function uses the [Get] package to
/// push the named route for the feedbackScreen.
onTapFeedback() { Get.toNamed(AppRoutes.feedbackScreen, ); } 
/// Navigates to the privacyPolicyScreen when the action is triggered.

/// When the action is triggered, this function uses the [Get] package to
/// push the named route for the privacyPolicyScreen.
onTapPrivacypolicy() { Get.toNamed(AppRoutes.privacyPolicyScreen, ); } 
/// Navigates to the premiumScreen when the action is triggered.

/// When the action is triggered, this function uses the [Get] package to
/// push the named route for the premiumScreen.
onTapPremium() { Get.toNamed(AppRoutes.premiumScreen, ); } 
 }
