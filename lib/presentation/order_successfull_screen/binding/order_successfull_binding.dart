import '../controller/order_successfull_controller.dart';
import 'package:get/get.dart';

/// A binding class for the OrderSuccessfullScreen.
///
/// This class ensures that the OrderSuccessfullController is created when the
/// OrderSuccessfullScreen is first loaded.
class OrderSuccessfullBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrderSuccessfullController());
  }
}
