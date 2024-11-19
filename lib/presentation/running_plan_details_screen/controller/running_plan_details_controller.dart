import 'package:diet_recipe_app/core/app_export.dart';
import 'package:diet_recipe_app/presentation/running_plan_details_screen/models/running_plan_details_model.dart';

/// A controller class for the RunningPlanDetailsScreen.
///
/// This class manages the state of the RunningPlanDetailsScreen, including the
/// current runningPlanDetailsModelObj
class RunningPlanDetailsController extends GetxController {
  Rx<RunningPlanDetailsModel> runningPlanDetailsModelObj =
      RunningPlanDetailsModel().obs;
}
