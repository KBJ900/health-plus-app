import 'dart:io';

import 'package:flutter/services.dart';
import 'package:diet_recipe_app/core/app_export.dart';
import 'package:diet_recipe_app/presentation/home_screen_container_screen/models/home_screen_container_model.dart';

import '../../../../data/pref_data/pref_data.dart';

/// A controller class for the HomeScreenContainerScreen.
///
/// This class manages the state of the HomeScreenContainerScreen, including the
/// current homeScreenContainerModelObj
class HomeDoctorContainerController extends GetxController {
  Rx<HomeScreenContainerModel> homeScreenContainerModelObj =
      HomeScreenContainerModel().obs;

  setIndex(int indexs) {
   PrefData.currentIndex =indexs;
   update();
  }

  onExit() {
   if (PrefData.currentIndex != 0) {
    PrefData.currentIndex = 0;
    update();
   } else {
    if (Platform.isIOS) {
     exit(0);
    } else {
     SystemNavigator.pop();
    }
   }
  }
}
