import 'package:diet_recipe_app/core/app_export.dart';import 'package:diet_recipe_app/presentation/what_for_lunch_screen/models/what_for_lunch_model.dart';/// A controller class for the WhatForLunchScreen.
///
/// This class manages the state of the WhatForLunchScreen, including the
/// current whatForLunchModelObj
class WhatForLunchController extends GetxController {Rx<WhatForLunchModel> whatForLunchModelObj = WhatForLunchModel().obs;

 }
