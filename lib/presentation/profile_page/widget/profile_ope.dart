import 'package:flutter/material.dart';
import 'package:diet_recipe_app/core/utils/size_utils.dart';

import '../../../core/utils/image_constant.dart';
import '../../../theme/theme_helper.dart';
import '../../../widgets/custom_image_view.dart';

class ProfileOpe extends StatelessWidget {
  final String? optionImg;
  final String? optionName;
  final VoidCallback? onTapOption;

   ProfileOpe({ this.optionImg, this.optionName, this.onTapOption});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () {
        onTapOption?.call();
      },
      child: Container(
        margin: getMargin(left: 20,right: 20,bottom: 16),
        padding: getPadding(left: 8,right: 16,top: 8,bottom: 8),
        decoration: BoxDecoration(
            color: AppColor.grey100,
            borderRadius: BorderRadius.circular(getHorizontalSize(16))
        ),
        child: Row(
          children: [
            Container(
              height: getSize(48),
              width: getSize(48),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColor.white,
                shape: BoxShape.circle,
              ),
              child: CustomImageView(
                svgPath: optionImg??ImageConstant.imgIcprofile,
                height: getSize(24),
                width: getSize(24),
                alignment: Alignment.center,
              ),
            ),
            Expanded(
              child: Padding(
                padding: getPadding(left: 16),
                child: Text(optionName??'My profile',style: theme.textTheme.bodyLarge,),
              ),
            ),
            CustomImageView(
              svgPath: ImageConstant.imgArrowrightBlack900,
              height: getSize(24),
              width: getSize(24),
            ),

          ],
        ),
      ),
    );
  }
}
