import '../controller/recommendations_controller.dart';
import 'package:flutter/material.dart';
import 'package:diet_recipe_app/core/app_export.dart';

// ignore: must_be_immutable
class RecommendationsItemWidget extends StatelessWidget {
  final String? img;
  final String? text;
  final Color?color;
  RecommendationsItemWidget(
     {
    Key? key, this.img, this.text, this.color,
  }) : super(
          key: key,
        );



  var controller = Get.find<RecommendationsController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color??Color(0xFFCAE3F1),
        borderRadius: BorderRadius.circular(getHorizontalSize(16))
      ),
      // decoration: AppDecoration.fillBlue.copyWith(
      //   borderRadius: BorderRadiusStyle.roundedBorder16,
      // ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: CustomImageView(
              imagePath: img??ImageConstant.imgR3,
              height: getVerticalSize(150),
              radius: BorderRadius.circular(
                getHorizontalSize(16),
              ),
              alignment: Alignment.centerRight,
            ),
          ),
          Padding(
            padding: getPadding(
              top: 8,
              left: 15,
              bottom: 8,
              right: 16
            ),
            child: Expanded(
              child: Text(text??
                  'Salmon with mixed salad',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: getFontSize(18)
                  )
                ),
            ),

          ),
        ],
      ),
    );
  }
}
