import 'package:flutter/material.dart';
import 'package:diet_recipe_app/core/app_export.dart';
import 'package:diet_recipe_app/data/listdata/app_listdata.dart';
import 'package:diet_recipe_app/widgets/app_bar_text.dart';
import 'package:diet_recipe_app/widgets/custom_elevated_button.dart';
import '../my_cart_screen/widgets/my_cart_item_widget.dart';
import 'controller/my_cart_controller.dart';

class MyCartScreen extends GetWidget<MyCartController> {
  const MyCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
        backgroundColor: theme.colorScheme.onPrimaryContainer,

        body: SafeArea(
          child: Column(
           mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
               AppBarText(
                onTap: () => Get.back(),
                title: 'My cart',
               ),
                Flexible(
                    child: ListView.separated(
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
                ),
                Padding(
                    padding: getPadding(top: 27, left: 20,right: 20),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                              padding: getPadding(top: 2, bottom: 2),
                              child: Text("lbl_total_amout".tr,
                                  style: theme.textTheme.titleMedium)),
                          Text("lbl_61_00".tr,
                              style: theme.textTheme.titleLarge)
                        ],
                    ),
                ),
              ],
          ),
        ),
        bottomNavigationBar: CustomElevatedButton(
            text: "lbl_continue".tr,
            margin: getMargin(left: 20, right: 20, bottom: 40),
            onTap: () {
              onTapContinue();
            }
            )
    );
  }

  onTapMycart() {
    Get.toNamed(
      AppRoutes.detailsScreen,
    );
  }

  onTapContinue() {
    Get.toNamed(
      AppRoutes.addressScreen,
    );
  }
}
