import '../controller/track_order_one_controller.dart';
import 'package:get/get.dart';

/// A binding class for the TrackOrderOneScreen.
///
/// This class ensures that the TrackOrderOneController is created when the
/// TrackOrderOneScreen is first loaded.
class TrackOrderOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TrackOrderOneController());
  }
}
