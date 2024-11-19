import 'package:diet_recipe_app/core/app_export.dart';
import 'package:diet_recipe_app/presentation/menu_tab_container_page/models/menu_tab_container_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the MenuTabContainerPage.
///
/// This class manages the state of the MenuTabContainerPage, including the
/// current menuTabContainerModelObj
class MenuTabContainerController extends GetxController
    with GetSingleTickerProviderStateMixin {
  MenuTabContainerController(this.menuTabContainerModelObj);

  Rx<MenuTabContainerModel> menuTabContainerModelObj;

  late TabController tabviewController =
      Get.put(TabController(vsync: this, length: 4));
}
