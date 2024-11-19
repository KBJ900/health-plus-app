import '../controller/select_month_controller.dart';
import 'package:get/get.dart';

/// A binding class for the SelectMonthScreen.
///
/// This class ensures that the SelectMonthController is created when the
/// SelectMonthScreen is first loaded.
class SelectMonthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SelectMonthController());
  }
}
