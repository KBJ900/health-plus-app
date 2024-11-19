import 'package:flutter/material.dart';
import 'package:diet_recipe_app/core/app_export.dart';
import 'package:diet_recipe_app/presentation/choose_your_plan_standard_tab_container_screen/models/choose_your_plan_standard_tab_container_model.dart';

/// A controller class for the ChooseYourPlanStandardTabContainerScreen.
///
/// This class manages the state of the ChooseYourPlanStandardTabContainerScreen, including the
/// current chooseYourPlanStandardTabContainerModelObj
class ChooseYourPlanStandardTabContainerController extends GetxController
    with GetSingleTickerProviderStateMixin {
  Rx<ChooseYourPlanStandardTabContainerModel>
      chooseYourPlanStandardTabContainerModelObj =
      ChooseYourPlanStandardTabContainerModel().obs;

  late TabController tabviewController = TabController(vsync: this, length: 2);
}
