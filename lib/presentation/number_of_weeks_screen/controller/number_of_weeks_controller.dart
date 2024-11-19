import 'package:diet_recipe_app/core/app_export.dart';import 'package:diet_recipe_app/presentation/number_of_weeks_screen/models/number_of_weeks_model.dart';/// A controller class for the NumberOfWeeksScreen.
///
/// This class manages the state of the NumberOfWeeksScreen, including the
/// current numberOfWeeksModelObj
class NumberOfWeeksController extends GetxController {Rx<NumberOfWeeksModel> numberOfWeeksModelObj = NumberOfWeeksModel().obs;

 }
