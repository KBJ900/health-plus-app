import 'package:flutter/material.dart';
import 'package:diet_recipe_app/core/app_export.dart';
import 'package:diet_recipe_app/data/listdata/app_listdata.dart';
import 'package:diet_recipe_app/widgets/app_bar_text.dart';
import '../notifications_screen/widgets/notificationrow_item_widget.dart';
import 'controller/notifications_controller.dart';


class NotificationsScreen extends GetWidget<NotificationsController> {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
        backgroundColor: theme.colorScheme.onPrimaryContainer,
      
        body: SafeArea(
          child: Column(
            children: [
             AppBarText(onTap: () => Get.back(),
             title: 'Notifications',),
              Expanded(
                child: ListView.separated(
                  padding: getPadding(top: 16),
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return SizedBox(height: getVerticalSize(16));
                    },
                    itemCount: AppListData.notificationList.length,
                    itemBuilder: (context, index) {

                      return NotificationrowItemWidget(
                        message: AppListData.notificationList[index].message,
                        time: AppListData.notificationList[index].time,
                      );
                    }),
              ),
            ],
          ),
        ));
  }

  /// Navigates to the homeScreenContainerScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the homeScreenContainerScreen.
  onTapNotifications() {
    Get.toNamed(
      AppRoutes.homeScreenContainerScreen,
    );
  }
}
