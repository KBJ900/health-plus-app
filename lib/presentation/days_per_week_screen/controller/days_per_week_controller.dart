import 'package:diet_recipe_app/core/app_export.dart';import 'package:diet_recipe_app/presentation/days_per_week_screen/models/days_per_week_model.dart';/// A controller class for the DaysPerWeekScreen.
///
/// This class manages the state of the DaysPerWeekScreen, including the
/// current daysPerWeekModelObj
class DaysPerWeekController extends GetxController {Rx<DaysPerWeekModel> daysPerWeekModelObj = DaysPerWeekModel().obs;

 }
