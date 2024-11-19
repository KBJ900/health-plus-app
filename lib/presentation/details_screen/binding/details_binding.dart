import '../controller/details_controller.dart';
import 'package:get/get.dart';

/// A binding class for the DetailsScreen.
///
/// This class ensures that the DetailsController is created when the
/// DetailsScreen is first loaded.
class DetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailsController());
  }
}
