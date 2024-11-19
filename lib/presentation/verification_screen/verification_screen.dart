import 'package:flutter/material.dart';
import 'package:diet_recipe_app/core/app_export.dart';
import 'package:diet_recipe_app/widgets/app_bar_text.dart';
import 'package:diet_recipe_app/widgets/custom_elevated_button.dart';
import 'package:pinput/pinput.dart';
import 'controller/verification_controller.dart';

// ignore: must_be_immutable
class VerificationScreen extends GetWidget<VerificationController> {
   VerificationScreen({Key? key}) : super(key: key);

  String otp= '000000';
  bool isOtp = false;
   GlobalKey<FormState> _formKey = GlobalKey<FormState>();



  final defaultPinTheme = PinTheme(


   width: getSize(50),
   height: getSize(50),
   textStyle:  TextStyle(
    fontSize: getFontSize(24),
    color: Color(0xFF7C7C7C),
    fontWeight: FontWeight.w400,
   ),

   decoration: BoxDecoration(
     color: AppColor.grey100,
    border: Border.all(
     color:Colors.transparent,
     width: getSize(1),
    ),
    borderRadius: BorderRadius.circular(getHorizontalSize(12)),
   ),
  );
  final errorPinTheme = PinTheme(
   width: getSize(50),
   height: getSize(50),
   textStyle:  TextStyle(
    fontSize: getFontSize(24),
    color: Colors.black,
    fontWeight: FontWeight.w400,
   ),

   decoration: BoxDecoration(
     color: AppColor.grey100,
    border: Border.all(
     color:Colors.red,
     width: getSize(1),
    ),
    borderRadius: BorderRadius.circular(getHorizontalSize(12)),
   ),
  );
  final pinController = TextEditingController();

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
                  title: 'Verification',
                  onTap: () => Get.back(),
                 ),
                  Padding(
                    padding: getPadding(top: 16,right: 20,left: 20),
                    child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "msg_please_enter_the2".tr,
                              style: theme.textTheme.bodyLarge),
                          TextSpan(
                              text: "\njohnabram@gmail.com".tr,
                              style: CustomTextStyles.bodyLargePrimary)
                        ]),
                        textAlign: TextAlign.left),
                  ),


                 GetBuilder<VerificationController>(builder: (controller) {
                   return Padding(
                    padding:  getPadding(left: 14,right: 14,top: 40),

                    child: Pinput(

                     length: 6,
                     controller: pinController,
                     keyboardType: TextInputType.number,
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     errorPinTheme: errorPinTheme,
                     errorTextStyle: TextStyle(
                         color: Colors.red
                     ),
                     defaultPinTheme:defaultPinTheme,

                     validator: (s) {
                      return s == '000000' ? null : 'Please enter a valid code';
                     },
                     pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                     showCursor: true,
                     onCompleted: (pin) {

                     },
                    ),
                   );
                 },init: VerificationController(),),


                  Align(
                      alignment: Alignment.center,
                      child: Padding(
                          padding: getPadding(top: 45),
                          child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "msg_didn_t_get_code2".tr,
                                    style:
                                        CustomTextStyles.bodyLargeOnError),
                                TextSpan(
                                    text: "lbl_resend_code".tr,
                                    style: CustomTextStyles
                                        .titleMediumPrimary_1)
                              ]),
                              textAlign: TextAlign.left))),
                  CustomElevatedButton(
                      text: "lbl_verify".tr,
                      margin: getMargin(top: 48, left: 20,right: 20),
                      onTap: () {

                        if(_formKey.currentState!.validate()){
                          onTapVerify();
                          pinController.clear();
                        }
                        else{

                        }

                      })
                ]),
          ),
        ));
  }


  onTapVerification() {
    Get.toNamed(
      AppRoutes.forgotPasswordScreen,
    );
  }
  onTapVerify() {
    Get.toNamed(
      AppRoutes.verificationOneScreen,
    );
  }
}
