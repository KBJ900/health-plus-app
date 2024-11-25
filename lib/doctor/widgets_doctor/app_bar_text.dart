import 'package:flutter/material.dart';
import 'package:diet_recipe_app/core/app_export.dart';

class AppBarText extends StatelessWidget {
  final String? title;
  final GestureTapCallback? onTap;
  final Widget? rightIcon;
  const AppBarText({ this.title, this.onTap, this.rightIcon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(left: 20,right: 20,top: 29,bottom: 16),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
             onTap!();
            },
            child: Padding(
              padding: getPadding(right: 16),
              child: CustomImageView(
                  svgPath: ImageConstant.imgArrowleftBlack900,
                  height: getSize(24),
                  width: getSize(24),
                  ),),

          ),
          Expanded(
            child: Text(title??'Forgot password?',style: TextStyle(
              color: Colors.black,
              fontSize: getFontSize(28),
              fontWeight: FontWeight.w700,
            ),),
          ),
          rightIcon??SizedBox(),
        ],
      ),
    );
  }
}
