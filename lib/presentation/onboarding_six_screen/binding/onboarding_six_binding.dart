import '../controller/onboarding_six_controller.dart';
import 'package:get/get.dart';

/// A binding class for the OnboardingSixScreen.
///
/// This class ensures that the OnboardingSixController is created when the
/// OnboardingSixScreen is first loaded.
class OnboardingSixBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnboardingSixController());
  }
}
