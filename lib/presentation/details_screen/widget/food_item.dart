import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../core/utils/image_constant.dart';
import '../../../core/utils/size_utils.dart';
import '../../../theme/theme_helper.dart';
import '../../../widgets/custom_image_view.dart';
import '../controller/details_controller.dart';

class FoodItemCount extends StatelessWidget {
  final String? name;
  const FoodItemCount({ this.name});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailsController>(builder: (dController) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              if(dController.item > 1){
                dController.item = dController.item-1;
                dController.update();
              }

            },
            child: Container(
                padding: getPadding(all: 8),
                decoration: BoxDecoration(
                    color: AppColor.grey100,
                    borderRadius: BorderRadius.circular(getHorizontalSize(8))
                ),
                child:CustomImageView(
                  imagePath: ImageConstant.minus,

                  color: AppColor.black,
                  height: getSize(24),
                )
            ),
          ),
          Padding(
            padding: getPadding(left: 16,right: 16),
            child: Text('0${dController.item.toString()}',style: TextStyle(
              color: AppColor.black,
              fontWeight: FontWeight.w400,
              fontSize: getFontSize(16),
            ),),
          ),
          GestureDetector(
            onTap: () {
              if(dController.item < 9){
                dController.item = dController.item+1;
                dController.update();
              }
            },
            child: Container(
                padding: getPadding(all: 8),
                decoration: BoxDecoration(
                    color: AppColor.grey100,
                    borderRadius: BorderRadius.circular(getHorizontalSize(8))
                ),
                child:CustomImageView(
                  imagePath: ImageConstant.add,
                  color: AppColor.black,
                  height: getSize(24),
                )
            ),
          ),
        ],
      );
    },init: DetailsController(),);
  }
}
