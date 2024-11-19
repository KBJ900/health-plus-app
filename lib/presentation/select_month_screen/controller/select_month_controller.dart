import 'package:diet_recipe_app/core/app_export.dart';import 'package:diet_recipe_app/presentation/select_month_screen/models/select_month_model.dart';/// A controller class for the SelectMonthScreen.
///
/// This class manages the state of the SelectMonthScreen, including the
/// current selectMonthModelObj
class SelectMonthController extends GetxController {Rx<SelectMonthModel> selectMonthModelObj = SelectMonthModel().obs;

 }
