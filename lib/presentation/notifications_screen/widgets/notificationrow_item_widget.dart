import '../controller/notifications_controller.dart';

import 'package:flutter/material.dart';
import 'package:diet_recipe_app/core/app_export.dart';
import 'package:diet_recipe_app/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class NotificationrowItemWidget extends StatelessWidget {
  final String? message;
  final String? time;
  NotificationrowItemWidget(
    {
    Key? key, this.message, this.time,
  }) : super(
          key: key,
        );


  var controller = Get.find<NotificationsController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: getMargin(left: 20,right: 20),
      padding: getPadding(
        left: 16,
        top: 10,
        right: 16,
        bottom: 10,
      ),
      decoration: AppDecoration.fillGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomIconButton(
            height: getSize(50),
            width: getSize(50),
            margin: getMargin(
              top: 5,
              bottom: 5,
            ),
            padding: getPadding(
              all: 13,
            ),
            decoration: IconButtonStyleHelper.fillOnPrimaryContainerTL25,
            child: CustomImageView(
              svgPath: ImageConstant.imgIcnotification,
            ),
          ),
          Expanded(
            child: Padding(
              padding: getPadding(
                left: 12,
                top: 7,
                bottom: 8,
              ),
              child: Text(
                  message!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodyLarge!.copyWith(
                    height: 1.58,

                ),
              ),
            ),
          ),
          Padding(
            padding: getPadding(
              left: 17,
              top: 40,
            ),
            child: Text(
                time??'',
                style: CustomTextStyles.bodyLargeOnError_1,
              ),

          ),
        ],
      ),
    );
  }
}
