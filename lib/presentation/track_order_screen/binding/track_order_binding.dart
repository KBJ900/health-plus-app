import '../controller/track_order_controller.dart';
import 'package:get/get.dart';

/// A binding class for the TrackOrderScreen.
///
/// This class ensures that the TrackOrderController is created when the
/// TrackOrderScreen is first loaded.
class TrackOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TrackOrderController());
  }
}
