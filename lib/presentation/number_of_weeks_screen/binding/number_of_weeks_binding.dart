import '../controller/number_of_weeks_controller.dart';
import 'package:get/get.dart';

/// A binding class for the NumberOfWeeksScreen.
///
/// This class ensures that the NumberOfWeeksController is created when the
/// NumberOfWeeksScreen is first loaded.
class NumberOfWeeksBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NumberOfWeeksController());
  }
}
