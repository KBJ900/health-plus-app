import 'package:flutter/material.dart';
import 'package:diet_recipe_app/core/app_export.dart';
import 'package:diet_recipe_app/data/listdata/app_listdata.dart';
import 'package:diet_recipe_app/presentation/menu_page/models/menu_model.dart';

import '../models/ourmenu_item_model.dart';


class MenuPageController extends GetxController with GetSingleTickerProviderStateMixin{

  MenuPageController(this.menuModelObj);

  Rx<MenuModel> menuModelObj;
  late TabController tabviewController =
      Get.put(TabController(vsync: this, length: 4));

  List<OurMenuItemModel> getMenu = AppListData.getOurMenu();


}
