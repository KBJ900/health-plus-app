import 'package:flutter/material.dart';
import 'package:diet_recipe_app/core/app_export.dart';
import 'package:diet_recipe_app/presentation/address_screen/widget/order_status.dart';
import 'package:diet_recipe_app/widgets/app_bar_text.dart';
import 'package:diet_recipe_app/widgets/custom_elevated_button.dart';
import 'controller/address_controller.dart';

class AddressScreen extends GetWidget<AddressController> {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
        backgroundColor: theme.colorScheme.onPrimaryContainer,

        body: SafeArea(
          child: GetBuilder<AddressController>(builder: (controller) {
            return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AppBarText(
                    onTap: () => Get.back(),
                    title: 'Address',
                  ),
                  Padding(
                    padding: getPadding(left: 36,right: 36,top: 16),
                    child: OrderStatus(
                      currentIndex: 1,
                    ),
                  ),


                  GestureDetector(
                    onTap: () {
                      controller.isHome = false;
                      controller.update();
                      controller.isOffice=true;
                      if(controller.isOffice){
                        controller.selectAdd = controller.addOffice;
                        controller.update();
                      }
                    },
                    child: Container(
                      margin: getMargin(left: 20,right: 20,top: 55,bottom: 16),

                      decoration: BoxDecoration(
                        color: AppColor.grey100,
                        borderRadius: BorderRadius.circular(getHorizontalSize(16)),
                      ),
                      child: Padding(
                        padding: getPadding(all: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                controller.isOffice?Container(
                                  height: getSize(24),
                                  width: getSize(24),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: AppColor.primaryColor,
                                      width: getSize(2.5),
                                    ),
                                  ),
                                  child: Container(
                                    margin: getMargin(all: 2),
                                    decoration: BoxDecoration(
                                      color: AppColor.primaryColor,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ): Container(
                                  height: getSize(24),
                                  width: getSize(24),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: AppColor.grey400,
                                      width: getSize(2.5),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: getPadding(left: 12),
                                    child: Text('Office',style: TextStyle(
                                      color: AppColor.black,
                                      fontSize: getFontSize(18),
                                      fontWeight: FontWeight.w700,
                                    ),),
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding:getPadding(top: 16,bottom: 8,right: 22),
                              child: Text(controller.addOffice,style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: getFontSize(16),
                                color: AppColor.black,

                              ),maxLines: 2,),
                            ),
                            Text('(505) 555-0125',style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: getFontSize(16),
                              color: Color(0xFF696969),
                            ),),


                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.isOffice = false;
                      controller.update();
                      controller.isHome=true;
                      if(controller.isHome){
                        controller.selectAdd = controller.addHome;
                        controller.update();
                      }
                    },
                    child: Container(
                      margin: getMargin(left: 20,right: 20,),
                      decoration: BoxDecoration(
                        color: AppColor.grey100,
                        borderRadius: BorderRadius.circular(getHorizontalSize(16)),
                      ),
                      child: Padding(
                        padding: getPadding(all: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                controller.isHome?Container(
                                  height: getSize(24),
                                  width: getSize(24),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: AppColor.primaryColor,
                                      width: getSize(2.5),
                                    ),
                                  ),
                                  child: Container(
                                    margin: getMargin(all: 2),
                                    decoration: BoxDecoration(
                                      color: AppColor.primaryColor,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ):Container(
                                  height: getSize(24),
                                  width: getSize(24),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: AppColor.grey400,
                                      width: getSize(2.5),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: getPadding(left: 12),
                                    child: Text('Home',style: TextStyle(
                                      color: AppColor.black,
                                      fontSize: getFontSize(18),
                                      fontWeight: FontWeight.w700,
                                    ),),
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding:getPadding(top: 16,bottom: 8,right: 22),
                              child: Text(controller.addHome,style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: getFontSize(16),
                                color: AppColor.black,

                              ),maxLines: 2,),
                            ),
                            Text('(201) 555-0124',style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: getFontSize(16),
                              color: Color(0xFF696969),
                            ),),


                          ],
                        ),
                      ),
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
                            child: Text('Add new address',style: TextStyle(
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
          },init: AddressController(),),
        ),
        bottomNavigationBar: CustomElevatedButton(
            text: "lbl_next".tr,
            margin: getMargin(left: 20, right: 20, bottom: 40),
            onTap: () {
              onTapNext();
            }));
  }

  
  onTapAddress() {
    Get.toNamed(
      AppRoutes.myCartScreen,
    );
  }

 
  onTapNext() {
    Get.toNamed(
      AppRoutes.paymentScreen,
    );
  }

  onTapAddnewaddress() {
    Get.toNamed(
      AppRoutes.addNewAddressScreen,
    );
  }
}
