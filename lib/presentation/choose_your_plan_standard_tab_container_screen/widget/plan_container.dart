import 'package:flutter/material.dart';
import 'package:diet_recipe_app/core/utils/image_constant.dart';
import 'package:diet_recipe_app/core/utils/size_utils.dart';

import '../../../theme/theme_helper.dart';
import '../../../widgets/custom_image_view.dart';

class PlanContainer extends StatelessWidget {
  final String? img;
  final String? planName;
  final Color? backColor;
  const PlanContainer({ this.img, this.planName, this.backColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color:backColor?? Color(0xFFF5E6EF),
          borderRadius: BorderRadius.circular(getHorizontalSize(16))
      ),
      child: Padding(
        padding: getPadding(left: 12,right: 12,top: 16,bottom: 16),
        child: Column(
          children: [
            Container(
              height: getSize(56),
              width: getSize(56),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.white,
              ),
              child: CustomImageView(
                svgPath:img?? ImageConstant.imgMap,),
            ),
            Padding(
              padding: getPadding(top: 8),
              child: Text(planName??'Premium plan',style:theme.textTheme.bodyLarge ,),
            ),

          ],
        ),
      ),
    );
  }
}
