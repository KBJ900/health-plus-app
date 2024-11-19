import '../controller/move_days_controller.dart';
import 'package:get/get.dart';

/// A binding class for the MoveDaysScreen.
///
/// This class ensures that the MoveDaysController is created when the
/// MoveDaysScreen is first loaded.
class MoveDaysBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MoveDaysController());
  }
}
