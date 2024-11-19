import '../controller/verification_confirm_controller.dart';
import 'package:get/get.dart';

/// A binding class for the VerificationConfirmScreen.
///
/// This class ensures that the VerificationConfirmController is created when the
/// VerificationConfirmScreen is first loaded.
class VerificationConfirmBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VerificationConfirmController());
  }
}
