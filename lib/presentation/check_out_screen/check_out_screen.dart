import 'package:flutter/material.dart';
import 'package:diet_recipe_app/core/app_export.dart';
import 'package:diet_recipe_app/presentation/address_screen/controller/address_controller.dart';
import 'package:diet_recipe_app/presentation/address_screen/widget/order_status.dart';
import 'package:diet_recipe_app/presentation/payment_screen/controller/payment_controller.dart';
import 'package:diet_recipe_app/widgets/app_bar_text.dart';
import 'package:diet_recipe_app/widgets/custom_elevated_button.dart';
import '../../data/listdata/app_listdata.dart';
import '../my_cart_screen/widgets/my_cart_item_widget.dart';
import 'controller/check_out_controller.dart';


class CheckOutScreen extends GetWidget<CheckOutController> {
  const CheckOutScreen({Key? key}) : super(key: key);

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
                  title: 'Check out',
                  onTap: () => Get.back(),
                ),

               Expanded(
                 child: ListView(
                   shrinkWrap: true,
                   primary: true,
                   physics: BouncingScrollPhysics(),
                   children: [
                     Padding(
                       padding: getPadding(left: 36, right: 36, top: 16, bottom: 60),
                       child: OrderStatus(
                         currentIndex: 3,
                       ),
                     ),
                     GetBuilder<AddressController>(
                       builder: (aController) {
                         return Container(
                           margin:
                           getMargin(left: 20, right: 20,  bottom: 24),
                           width: double.infinity,
                           decoration: BoxDecoration(
                             borderRadius:
                             BorderRadius.circular(getHorizontalSize(16)),
                             color: AppColor.grey100,
                           ),
                           child: Padding(
                             padding: getPadding(all: 16),
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text(
                                   'Shiping address',
                                   style: theme.textTheme.titleMedium,
                                 ),
                                 Padding(
                                   padding: getPadding(top: 8, right: 30),
                                   child: Text(
                                     aController.selectAdd.isEmpty?'4517 Washington Ave. Manchester, Kentucky 39495':aController.selectAdd,
                                     style: theme.textTheme.bodyLarge,
                                   ),
                                 ),
                               ],
                             ),
                           ),
                         );
                       },
                       init: AddressController(),
                     ),
                     GetBuilder<PaymentController>(
                       builder: (pController) {
                         return Container(
                           margin: getMargin(
                             left: 20,
                             right: 20,
                           ),
                           width: double.infinity,
                           decoration: BoxDecoration(
                             borderRadius:
                             BorderRadius.circular(getHorizontalSize(16)),
                             color: AppColor.grey100,
                           ),
                           child: Padding(
                             padding: getPadding(all: 16),
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text(
                                   'Payment method',
                                   style: theme.textTheme.titleMedium,
                                 ),
                                 Padding(
                                   padding: getPadding(top: 8, right: 30),
                                   child: Text(
                                     pController.selectMethod.isEmpty?'Google pay':pController.selectMethod,
                                     style: theme.textTheme.bodyLarge,
                                   ),
                                 ),
                               ],
                             ),
                           ),
                         );
                       },
                       init: PaymentController(),
                     ),
                     Padding(
                         padding: getPadding(top: 24, left: 20),
                         child: Text("lbl_cart_details".tr,
                             style: theme.textTheme.titleLarge)),
                     ListView.separated(
                       padding: getPadding(left: 20,right: 20,top: 16),
                       physics: NeverScrollableScrollPhysics(),
                       shrinkWrap: true,
                       separatorBuilder: (context, index) {
                         return SizedBox(height: getSize(16));
                       },
                       itemCount: AppListData.myCartList.length,
                       itemBuilder: (context, index) {

                         return MyCartItemWidget(
                           img: AppListData.myCartList[index].img,
                           name: AppListData.myCartList[index].name,
                           food: AppListData.myCartList[index].food,
                           price: AppListData.myCartList[index].price,
                         );
                       },
                     ),
                     // Padding(
                     //     padding:
                     //     getPadding(top: 24, bottom: 40, left: 20, right: 20),
                     //     child: Row(
                     //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     //         children: [
                     //           Padding(
                     //               padding: getPadding(top: 2, bottom: 2),
                     //               child: Text("lbl_total_amout".tr,
                     //                   style: theme.textTheme.titleMedium)),
                     //           Text("lbl_61_00".tr,
                     //               style: theme.textTheme.titleLarge)
                     //         ])),
                   ],
                 ),
               ),
                Padding(
                    padding:
                    getPadding(top: 24, bottom: 40, left: 20, right: 20),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                              padding: getPadding(top: 2, bottom: 2),
                              child: Text("lbl_total_amout".tr,
                                  style: theme.textTheme.titleMedium)),
                          Text("lbl_61_00".tr,
                              style: theme.textTheme.titleLarge)
                        ])),

              ]),
        ),
        bottomNavigationBar: CustomElevatedButton(
            text: "lbl_confirm".tr,
            margin: getMargin(left: 20, right: 20, bottom: 40),
            onTap: () {
              onTapConfirm();
            }
            )
    );
  }

  onTapCheckout() {
    Get.toNamed(
      AppRoutes.paymentScreen,
    );
  }

  onTapConfirm() {
    Get.toNamed(
      AppRoutes.orderSuccessfullScreen,
    );
  }
}
