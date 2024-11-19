import '../controller/check_out_controller.dart';
import '../models/shippingaddress_item_model.dart';
import 'package:flutter/material.dart';
import 'package:diet_recipe_app/core/app_export.dart';

// ignore: must_be_immutable
class ShippingaddressItemWidget extends StatelessWidget {
  ShippingaddressItemWidget(
    this.shippingaddressItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  ShippingaddressItemModel shippingaddressItemModelObj;

  var controller = Get.find<CheckOutController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: getPadding(
        left: 16,
        top: 18,
        right: 16,
        bottom: 18,
      ),
      decoration: AppDecoration.fillGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(
            () => Text(
              shippingaddressItemModelObj.shipingaddressTxt.value,
              style: theme.textTheme.titleMedium,
            ),
          ),
          Padding(
            padding: getPadding(
              top: 12,
              right: 53,
            ),
            child: Obx(
              () => Text(
                shippingaddressItemModelObj.addressTxt.value,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodyLarge!.copyWith(
                  height: 1.56,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
