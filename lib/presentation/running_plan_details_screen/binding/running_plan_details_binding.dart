import '../controller/running_plan_details_controller.dart';
import 'package:get/get.dart';

/// A binding class for the RunningPlanDetailsScreen.
///
/// This class ensures that the RunningPlanDetailsController is created when the
/// RunningPlanDetailsScreen is first loaded.
class RunningPlanDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RunningPlanDetailsController());
  }
}
