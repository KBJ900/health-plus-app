import '../controller/resetpassword_controller.dart';
import 'package:get/get.dart';


class ResetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ResetPasswordController());
  }
}
