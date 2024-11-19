import 'package:diet_recipe_app/core/app_export.dart';import 'package:diet_recipe_app/presentation/plan_duration_screen/models/plan_duration_model.dart';/// A controller class for the PlanDurationScreen.
///
/// This class manages the state of the PlanDurationScreen, including the
/// current planDurationModelObj
class PlanDurationController extends GetxController {Rx<PlanDurationModel> planDurationModelObj = PlanDurationModel().obs;

 }
