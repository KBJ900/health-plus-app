import '../controller/select_date_controller.dart';
import 'package:get/get.dart';

/// A binding class for the SelectDateScreen.
///
/// This class ensures that the SelectDateController is created when the
/// SelectDateScreen is first loaded.
class SelectDateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SelectDateController());
  }
}
