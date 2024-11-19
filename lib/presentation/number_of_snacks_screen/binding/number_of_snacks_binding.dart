import '../controller/number_of_snacks_controller.dart';
import 'package:get/get.dart';

/// A binding class for the NumberOfSnacksScreen.
///
/// This class ensures that the NumberOfSnacksController is created when the
/// NumberOfSnacksScreen is first loaded.
class NumberOfSnacksBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NumberOfSnacksController());
  }
}
