import '../controller/number_of_meals_controller.dart';
import 'package:get/get.dart';

/// A binding class for the NumberOfMealsScreen.
///
/// This class ensures that the NumberOfMealsController is created when the
/// NumberOfMealsScreen is first loaded.
class NumberOfMealsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NumberOfMealsController());
  }
}
