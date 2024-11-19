import '../controller/days_per_week_controller.dart';
import 'package:get/get.dart';

/// A binding class for the DaysPerWeekScreen.
///
/// This class ensures that the DaysPerWeekController is created when the
/// DaysPerWeekScreen is first loaded.
class DaysPerWeekBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DaysPerWeekController());
  }
}
