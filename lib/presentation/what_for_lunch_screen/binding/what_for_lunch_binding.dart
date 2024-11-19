import '../controller/what_for_lunch_controller.dart';
import 'package:get/get.dart';

/// A binding class for the WhatForLunchScreen.
///
/// This class ensures that the WhatForLunchController is created when the
/// WhatForLunchScreen is first loaded.
class WhatForLunchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WhatForLunchController());
  }
}
