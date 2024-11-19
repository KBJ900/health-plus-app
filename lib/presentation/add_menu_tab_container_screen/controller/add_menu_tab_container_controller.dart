import 'package:diet_recipe_app/core/app_export.dart';import 'package:diet_recipe_app/presentation/add_menu_tab_container_screen/models/add_menu_tab_container_model.dart';import 'package:flutter/material.dart';/// A controller class for the AddMenuTabContainerScreen.
///
/// This class manages the state of the AddMenuTabContainerScreen, including the
/// current addMenuTabContainerModelObj
class AddMenuTabContainerController extends GetxController with  GetSingleTickerProviderStateMixin {Rx<AddMenuTabContainerModel> addMenuTabContainerModelObj = AddMenuTabContainerModel().obs;

late TabController tabviewController = Get.put(TabController(vsync: this, length: 4));

 }
