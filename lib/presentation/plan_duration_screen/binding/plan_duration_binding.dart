import '../controller/plan_duration_controller.dart';
import 'package:get/get.dart';

/// A binding class for the PlanDurationScreen.
///
/// This class ensures that the PlanDurationController is created when the
/// PlanDurationScreen is first loaded.
class PlanDurationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PlanDurationController());
  }
}
