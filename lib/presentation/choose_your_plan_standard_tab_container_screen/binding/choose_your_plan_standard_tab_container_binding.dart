import '../controller/choose_your_plan_standard_tab_container_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ChooseYourPlanStandardTabContainerScreen.
///
/// This class ensures that the ChooseYourPlanStandardTabContainerController is created when the
/// ChooseYourPlanStandardTabContainerScreen is first loaded.
class ChooseYourPlanStandardTabContainerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChooseYourPlanStandardTabContainerController());
  }
}
