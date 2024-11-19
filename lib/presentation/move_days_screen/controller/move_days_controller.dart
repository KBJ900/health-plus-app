import 'package:diet_recipe_app/core/app_export.dart';import 'package:diet_recipe_app/presentation/move_days_screen/models/move_days_model.dart';/// A controller class for the MoveDaysScreen.
///
/// This class manages the state of the MoveDaysScreen, including the
/// current moveDaysModelObj
class MoveDaysController extends GetxController {Rx<MoveDaysModel> moveDaysModelObj = MoveDaysModel().obs;

 }
