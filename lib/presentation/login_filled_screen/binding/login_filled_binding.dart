import '../controller/login_filled_controller.dart';
import 'package:get/get.dart';

/// A binding class for the LoginFilledScreen.
///
/// This class ensures that the LoginFilledController is created when the
/// LoginFilledScreen is first loaded.
class LoginFilledBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginFilledController());
  }
}
