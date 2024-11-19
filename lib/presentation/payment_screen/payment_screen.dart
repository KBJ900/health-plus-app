import 'package:flutter/material.dart';
import 'package:diet_recipe_app/core/app_export.dart';
import 'package:diet_recipe_app/presentation/address_screen/widget/order_status.dart';
import 'package:diet_recipe_app/presentation/payment_screen/widget/payment_ope.dart';
import 'package:diet_recipe_app/widgets/app_bar_text.dart';
import 'package:diet_recipe_app/widgets/custom_elevated_button.dart';
import '../../generated/assets.dart';
import 'controller/payment_controller.dart';

class PaymentScreen extends GetWidget<PaymentController> {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
        backgroundColor: theme.colorScheme.onPrimaryContainer,

        body: SafeArea(
          child: GetBuilder<PaymentController>(builder: (controller) {
            return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  AppBarText(
                    onTap: () => Get.back(),
                    title: 'Payment',
                  ),
                  Padding(
                    padding: getPadding(left: 36,right: 36,top: 16),
                    child: OrderStatus(
                      currentIndex: 2,
                    ),
                  ),


                  GestureDetector(
                    onTap: () {
                      controller.isGoogle = true;
                      controller.update();
                      controller.isPayPal =false;
                      controller.update();
                      controller.isMasterCard = false;
                      controller.update();
                      if(controller.isGoogle)
                      {
                        controller.selectMethod = 'Google pay';
                      }
                    },
                    child: Padding(
                      padding: getPadding(top: 55,bottom: 16),
                      child: PaymentOpe(
                        type: controller.isGoogle,
                        name: 'Google pay',
                        img: ImageConstant.imgGooglepay11,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.isGoogle = false;
                      controller.update();
                      controller.isPayPal =true;
                      controller.update();
                      controller.isMasterCard = false;
                      controller.update();
                      if(controller.isPayPal)
                      {
                        controller.selectMethod = 'Paypal';
                      }
                    },
                    child: Padding(
                      padding:getPadding(bottom: 16),
                      child: PaymentOpe(
                        type: controller.isPayPal,
                        name: 'Paypal',
                        img: Assets.imagesImgIcPaypal,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.isGoogle = false;
                      controller.update();
                      controller.isPayPal =false;
                      controller.update();
                      controller.isMasterCard = true;
                      controller.update();
                      if(controller.isMasterCard  )
                      {
                        controller.selectMethod = 'Master card';
                      }
                    },
                    child: PaymentOpe(
                      type: controller.isMasterCard,
                      name: 'Master card',
                      img: Assets.imagesImgIcMastercard,
                    ),
                  ),


                  GestureDetector(
                    onTap: () {
                      onTapAddnewaddress();
                    },
                    child: Padding(
                      padding: getPadding(top: 32),

                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.add,size: getSize(24),color: Colors.black,),
                          Padding(
                            padding: getPadding(left: 8),
                            child: Text('Add new card',style: TextStyle(
                              color: AppColor.black,
                              fontSize: getFontSize(16),
                              fontWeight: FontWeight.w400,
                            ),),
                          )
                        ],
                      ),
                    ),
                  ),
                ]);
          },init: PaymentController(),)
        ),
        bottomNavigationBar: CustomElevatedButton(
            text: "lbl_next".tr,
            margin: getMargin(left: 20, right: 20, bottom: 40),
            onTap: () {
              onTapNext();
            }));
  }


  onTapPayment() {
    Get.toNamed(
      AppRoutes.addressScreen,
    );
  }


  onTapNext() {
    Get.toNamed(
      AppRoutes.checkOutScreen,
    );
  }


  onTapAddnewaddress() {
    Get.toNamed(
      AppRoutes.addNewCardScreen,
    );
  }
}
