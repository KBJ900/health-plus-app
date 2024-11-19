import '../controller/onboarding_five_controller.dart';
import 'package:get/get.dart';

/// A binding class for the OnboardingFiveScreen.
///
/// This class ensures that the OnboardingFiveController is created when the
/// OnboardingFiveScreen is first loaded.
class OnboardingFiveBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnboardingFiveController());
  }
}
