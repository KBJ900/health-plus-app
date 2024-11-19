import '../controller/check_out_controller.dart';
import 'package:get/get.dart';

/// A binding class for the CheckOutScreen.
///
/// This class ensures that the CheckOutController is created when the
/// CheckOutScreen is first loaded.
class CheckOutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CheckOutController());
  }
}
