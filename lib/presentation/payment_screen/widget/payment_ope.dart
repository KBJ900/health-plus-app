import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:diet_recipe_app/presentation/payment_screen/controller/payment_controller.dart';

import '../../../core/utils/image_constant.dart';
import '../../../core/utils/size_utils.dart';
import '../../../theme/theme_helper.dart';
import '../../../widgets/custom_image_view.dart';

class PaymentOpe extends StatelessWidget {
  final bool type;
  final String? name;
  final String? img;
  const PaymentOpe({ required this.type, this.name, this.img});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentController>(builder: (controller) {
      return Container(
        margin: getMargin(left: 20,right: 20),
        decoration: BoxDecoration(
            color: AppColor.grey100,
            borderRadius: BorderRadius.circular(getHorizontalSize(16))
        ),
        child: Padding(
          padding: getPadding(left:16,right: 20,top: 16,bottom: 17 ),
          child: Row(
            children: [
              type?Container(
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
                  child: Text(name??'Google pay',style: theme.textTheme.bodyLarge,),
                ),
              ),
              CustomImageView(
                svgPath:img?? ImageConstant.imgGooglepay11,
                height: getSize(40),
                width: getSize(40),
              )
            ],
          ),
        ),
      );
    },init: PaymentController(),);
  }
}
