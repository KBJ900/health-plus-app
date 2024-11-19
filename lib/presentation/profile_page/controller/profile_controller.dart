import 'dart:io';

import 'package:flutter/services.dart';
import 'package:diet_recipe_app/core/app_export.dart';
import 'package:diet_recipe_app/data/pref_data/pref_data.dart';
import 'package:diet_recipe_app/presentation/profile_page/models/profile_model.dart';

/// A controller class for the ProfilePage.
///
/// This class manages the state of the ProfilePage, including the
/// current profileModelObj
class ProfileController extends GetxController {
  ProfileController(this.profileModelObj);

  Rx<ProfileModel> profileModelObj;

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
