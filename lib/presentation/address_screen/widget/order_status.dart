import 'package:flutter/material.dart';
import 'package:diet_recipe_app/core/app_export.dart';

import '../../../generated/assets.dart';

class OrderStatus extends StatelessWidget {
  final double? currentIndex;
  const OrderStatus({ this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [

            currentIndex == 1? Container(
              padding: getPadding(all: 5),
              height: getSize(24),
              width: getSize(24),
              decoration: BoxDecoration(
                color:  Color(0xFF5E9920),
                shape: BoxShape.circle,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColor.white,
                  shape: BoxShape.circle
                ),
              ),
            ):Container(
              padding: getPadding(all: 5),
              height: getSize(24),
              width: getSize(24),
              decoration: BoxDecoration(
                color:  Color(0xFF5E9920),
                shape: BoxShape.circle,
              ),
              child: CustomImageView(
                svgPath: Assets.imagesImgIcdone,
              ),
            ),
              // color: currentIndex==1?AppColor.primaryColor:AppColor.primaryColor,
            Positioned(
              top: getSize(40),
              // right: 1.h,
              child: Text('Address',style: TextStyle(
               fontWeight: FontWeight.w400,
                color: AppColor.primaryColor,
                fontSize: getFontSize(16)
              ),),
            )
          ],
        ),
        Expanded(
          child: Divider(
            color: currentIndex==1? AppColor.grey200:AppColor.primaryColor,
            thickness: getSize(2),
          ),
        ),
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            if(currentIndex! > 2)...[
               Container(
                 padding: getPadding(all: 5),
                 height: getSize(24),
                 width: getSize(24),
                 decoration: BoxDecoration(
                   color:  Color(0xFF5E9920),
                   shape: BoxShape.circle,
                 ),
                 child: CustomImageView(
                   svgPath: Assets.imagesImgIcdone,
                 ),
               ),]
            else if(currentIndex! ==2 )...[ Container(
              padding: getPadding(all: 5),
              height: getSize(24),
              width: getSize(24),
              decoration: BoxDecoration(
                color:  Color(0xFF5E9920),
                shape: BoxShape.circle,
              ),
              child: Container(
                decoration: BoxDecoration(
                    color: AppColor.white,
                    shape: BoxShape.circle
                ),
              ),
            )]
            else...[ Icon(Icons.circle,color: AppColor.grey200,size: getSize(24),)],
            // Icon(currentIndex==1?Icons.circle:Icons.radio_button_checked,color: currentIndex==1?Colors.grey:const Color(0xFFFF595D),),
            Positioned(
              top: getSize(40),
              // right: 0.1.h,
              child: Text
                ('Payment',style: TextStyle(
                color:currentIndex!>1?AppColor.primaryColor: AppColor.black,
                fontWeight: FontWeight.w400,
                fontSize: getFontSize(16),
              ),textAlign: TextAlign.center,),
            )
          ],
        ),
        Expanded(
          child: Divider(
            color: currentIndex == 1|2?AppColor.primaryColor: AppColor.grey200,
            thickness: getSize(2),
          ),
        ),
        Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [

              currentIndex==3?Container(
                padding: getPadding(all: 5),
                height: getSize(24),
                width: getSize(24),
                decoration: BoxDecoration(
                  color:  Color(0xFF5E9920),
                  shape: BoxShape.circle,
                ),
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColor.white,
                      shape: BoxShape.circle
                  ),
                ),
              ):
              Icon(Icons.circle,color: AppColor.grey200,size: getSize(24),),

            Positioned(
              top: getSize(40),

              child: Text('Confirm',style: TextStyle(
                color: currentIndex==3?AppColor.primaryColor: AppColor.black,
                fontWeight: FontWeight.w400,
                fontSize: getFontSize(16),
              ),),
            )
          ],
        ),
      ],
    );
  }
}
