import '../controller/recommendations_controller.dart';
import 'package:get/get.dart';

/// A binding class for the RecommendationsScreen.
///
/// This class ensures that the RecommendationsController is created when the
/// RecommendationsScreen is first loaded.
class RecommendationsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RecommendationsController());
  }
}
