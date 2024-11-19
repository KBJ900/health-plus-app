import 'package:flutter/material.dart';
import 'package:diet_recipe_app/theme/theme_helper.dart';
import 'package:diet_recipe_app/widgets/custom_image_view.dart';

import '../../../core/utils/image_constant.dart';
import '../../../core/utils/size_utils.dart';

class SelectData extends StatelessWidget {
  final String? selectData;
  final Color? fontColor;
  const SelectData({ this.selectData, this.fontColor});

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: getMargin(bottom: 24),
      decoration: BoxDecoration(
        color: AppColor.grey100,
        borderRadius: BorderRadius.circular(getHorizontalSize(16)),
      ),
      child: Padding(
        padding: getPadding(all: 16),
        child: Row(
          children: [
            Expanded(
              child: Text(selectData??'Plan duration',style: TextStyle(
                  fontSize: getFontSize(16),
                  fontWeight: FontWeight.w400,
                  color: fontColor??AppColor.grey400
              ),),
            ),
            CustomImageView(
              svgPath: ImageConstant.imgArrowdown,
            ),

          ],
        ),
      ),
    );
  }
}
