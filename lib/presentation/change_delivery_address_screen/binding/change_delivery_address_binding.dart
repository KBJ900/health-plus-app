import '../controller/change_delivery_address_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ChangeDeliveryAddressScreen.
///
/// This class ensures that the ChangeDeliveryAddressController is created when the
/// ChangeDeliveryAddressScreen is first loaded.
class ChangeDeliveryAddressBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChangeDeliveryAddressController());
  }
}
