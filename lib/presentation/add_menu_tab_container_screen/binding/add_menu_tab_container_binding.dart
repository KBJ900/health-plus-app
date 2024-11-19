import '../controller/add_menu_tab_container_controller.dart';
import 'package:get/get.dart';

/// A binding class for the AddMenuTabContainerScreen.
///
/// This class ensures that the AddMenuTabContainerController is created when the
/// AddMenuTabContainerScreen is first loaded.
class AddMenuTabContainerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddMenuTabContainerController());
  }
}
